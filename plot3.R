# To avoid what I would argue is unnecessary code duplication the source file 
# contains two helper functions:
#     processData() - Get the dataframe from the file and returns it
#     plotGraph() - Takes a filename, the function to generate the plot and
#                   the data.frame to create the plot

source('helper_functions.R')

plot3 <- function( df ){
  # Create a vector of the colours and columns we are going to use for the plot
  colours <- c('black', 'red', 'blue')
  columns <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
  
  # Setup the plot with the ylabel but blank xlabel
  plot(df$datetime, df$Sub_metering_1, type='n',
       ylab = 'Energy sub metering',
       xlab = '')
  # Now iterate over the three columns and colours we setup and plot them onto 
  # the active plot
  for(i in 1:3){
    lines(df$datetime, df[[columns[i]]], col = colours[i])
  }
  # Finally add the legend to the top right
  legend('topright', col=colours, legend=columns, lwd=1)
}

# As described above plot the graph
plotGraph('plot3.png', plot3, processData('household_power_consumption.txt'))