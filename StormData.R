if(!exists("StormData.csv.bz2")){
download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2", "StormData.csv.bz2")
}

library(dplyr)
library(data.table)
stormdata <- fread("StormData.csv.bz2")


#Question 1
pophealth <- stormdata %>% select(EVTYPE, FATALITIES, INJURIES)

#Question 2
economy <- stormdata %>% select(EVTYPE, PROPDMG, PROPDMGEXP, CROPDMG, CROPDMGEXP)
