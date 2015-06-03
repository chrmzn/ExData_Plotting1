library(data.table)
library(dplyr)
library(lubridate)

processData <- function( fileName ){
  # Set the dates that we want to select
  requiredDate <- c(ymd('2007-02-01'), ymd('2007-02-02'))
  # fread the data into df (it's quick!)
  df <- fread( fileName )
  # The fread fails where it finds '?' in the data so before we correct the data
  # we will start by filtering the data.frame for the dates we want
  df <- df %>% 
          mutate(Date=dmy(Date)) %>% 
          filter(Date %in% requiredDate)
  # Now we correct the data
  values <- df %>% 
              select(-(Date:Time)) %>%
              mutate_each(funs(as.numeric))
  # Create a datetime colmnn of Date + Time
  temporal <- df %>% 
                select(Date,Time) %>%
                mutate(datetime=Date + hms(Time)) %>%
                select(datetime)
  # Finally cbind the two together and cleanup the temporary variables
  df <- cbind(temporal, values)
  df
}

plotGraph <- function( plotName, func, ... ){
  # Create the png device
  png(filename = plotName )
  # Plot the graph using the funciton that we pass to plotGraph
  # along with any additional arguments
  func(...)
  # Close the device!
  dev.off()
}