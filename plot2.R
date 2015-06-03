# To avoid what I would argue is unnecessary code duplication the source file 
# contains two helper functions:
#     processData() - Get the dataframe from the file and returns it
#     plotGraph() - Takes a filename, the function to generate the plot and
#                   the data.frame to create the plot
source('helper_functions.R')

plot2 <- function( df ){
  # Start by plotting a black graph with just a ylabel but blanked 
  # xlabel
  plot(df$datetime, 
       df$Global_active_power, 
       type ='n',
       ylab = 'Global Active Power (kilowatts)',
       xlab ='')
  # Plot the lines onto active plot
  lines(df$datetime, df$Global_active_power)
}

# As described above plot the graph
plotGraph('plot2.png', plot2, processData('household_power_consumption.txt'))