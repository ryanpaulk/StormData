if(!file.exists("StormData.csv.bz2")){
download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2", "StormData.csv.bz2")
}

library(dplyr)
library(data.table)
library(ggplot2)
stormdata <- fread("StormData.csv.bz2")


#Question 1
pophealth <- stormdata %>% select(EVTYPE, FATALITIES, INJURIES)
## Combine the columns and filter out the zeroes
harmed <- pophealth %>% select(EVTYPE, FATALITIES, INJURIES) %>% mutate(HARMED = FATALITIES + INJURIES) %>% filter(HARMED != 0)
## Aggregate totals by the event type
harmed <- aggregate(cbind(FATALITIES, INJURIES, HARMED) ~ EVTYPE, data = harmed, FUN = sum)
## Arrange by total harmed, then by most fatalities
harmed <- arrange(harmed, desc(HARMED, FATALITIES))
## Plot the top ten?
#Question 2
economy <- stormdata %>% select(EVTYPE, PROPDMG, PROPDMGEXP, CROPDMG, CROPDMGEXP)
## Change letter suffixes in EXP to numeric multipliers of DMG
economy$CROPDMGEXP <- gsub("k", "1000", economy$CROPDMGEXP, ignore.case = TRUE)
economy$CROPDMGEXP <- gsub("m", "1000000", economy$CROPDMGEXP, ignore.case = TRUE)
economy$PROPDMGEXP <- gsub("k", "1000", economy$PROPDMGEXP, ignore.case = TRUE)
economy$PROPDMGEXP <- gsub("m", "1000000", economy$PROPDMGEXP, ignore.case = TRUE)
## Found out there are some other modifiers around...
table(economy$PROPDMGEXP)
economy$PROPDMGEXP <- gsub("h", "100", economy$PROPDMGEXP, ignore.case = TRUE)
economy$PROPDMGEXP <- gsub("b", "1000000000", economy$PROPDMGEXP, ignore.case = TRUE)
economy$PROPDMGEXP <- gsub("\\-|\\?|\\+|2|3|4|5|6|7|8|9", "1", economy$PROPDMGEXP, ignore.case = TRUE)
table(economy$CROPDMGEXP)
economy$CROPDMGEXP <- gsub("b", "1000000000", economy$CROPDMGEXP, ignore.case = TRUE)
economy$CROPDMGEXP <- gsub("\\?|2", "1", economy$CROPDMGEXP, ignore.case = TRUE)

economy$CROPDMGEXP <- as.numeric(economy$CROPDMGEXP)
economy$PROPDMGEXP <- as.numeric(economy$PROPDMGEXP)

##Combine the DMG and EXP columns

eco <- economy %>% mutate(PROP = PROPDMG * PROPDMGEXP, CROP = CROPDMG * CROPDMGEXP)
ecodmg <- aggregate(cbind(PROP, CROP) ~ EVTYPE, data = eco, FUN = sum)
ecodmg$TOTAL <- ecodmg$PROP + ecodmg$CROP
ecodmg <- arrange(ecodmg, desc(TOTAL))
