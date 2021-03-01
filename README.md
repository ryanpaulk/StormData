# StormData

## Questions
Your data analysis must address the following questions:

1. Across the United States, which types of events (as indicated in the \color{red}{\verb|EVTYPE|}EVTYPE variable) are most harmful with respect to population health? \Fatalities\ and \Injuries\

2. Across the United States, which types of events have the greatest economic consequences? \PropertyDamage and \CropDamage


  Consider writing your report as if it were to be read by a government or municipal manager who might be responsible for preparing for severe weather events and will need to prioritize resources for different types of events. However, there is no need to make any specific recommendations in your report.
    
    
## Document Layout

- Language: Your document should be written in English.

- Title: Your document should have a title that briefly summarizes your data analysis

- Synopsis: Immediately after the title, there should be a synopsis which describes and summarizes your analysis in at most 10 complete sentences.

- There should be a section titled Data Processing which describes (in words and code) how the data were loaded into R and processed for analysis. In particular, your analysis must start from the raw CSV file containing the data. You cannot do any preprocessing outside the document. If preprocessing is time-consuming you may consider using the \color{red}{\verb|cache = TRUE|}cache = TRUE option for certain code chunks.

- There should be a section titled Results in which your results are presented.

- You may have other sections in your analysis, but Data Processing and Results are required.

- The analysis document must have at least one figure containing a plot.

- Your analysis must have no more than three figures. Figures may have multiple plots in them (i.e. panel plots), but there cannot be more than three figures total.

- You must show all your code for the work in your analysis document. This may make the document a bit verbose, but that is okay. In general, you should ensure that \color{red}{\verb|echo = TRUE|}echo = TRUE for every code chunk (this is the default setting in knitr).