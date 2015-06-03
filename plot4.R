# To avoid what I would argue is unnecessary code duplication the source file 
# contains two helper functions:
#     processData() - Get the dataframe from the file and returns it
#     plotGraph() - Takes a filename, the function to generate the plot and
#                   the data.frame to create the plot
source('helper_functions.R')

plot4 <- function( df ){
  # Setup the mfcol to create 4 sub-plots
  par(mfcol=c(2,2))
  
  # Setup plot
  plot(df$datetime, 
       df$Global_active_power, 
       type ='n',
       ylab = 'Global Active Power',
       xlab ='')
  # Add line to active plot
  lines(df$datetime, df$Global_active_power)
  
  # Similar to plot3 setup the colour and column vectors
  colours <- c('black', 'red', 'blue')
  columns <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
  # Setup the basic plot
  plot(df$datetime, df$Sub_metering_1, type='n',
       ylab = 'Energy sub metering',
       xlab = '')
  # Iterate over all the columns/colors plotting them onto the active plot
  for(i in 1:3){
    lines(df$datetime, df[[columns[i]]], col = colours[i])
  }
  # Finally add the legend
  legend('topright', col=colours, legend=columns, lwd=1)
  
  # Create plot with ylabel and xlabel
  plot(df$datetime,df$Voltage, ylab='Voltage', xlab='datetime', type = 'n')
  # Add line to atcive plot
  lines(df$datetime,df$Voltage, ylab='Voltage', xlab='datetime')
  
  # Create plot with ylabel and xlabel
  plot(df$datetime,df$Global_reactive_power, ylab='Global_reactive_power', xlab='datetime', type = 'n')
  # Add line to atcive plot
  lines(df$datetime,df$Global_reactive_power, ylab='Global_reactive_power', xlab='datetime')
}

# As described above plot the graph
plotGraph('plot4.png', plot4, processData('household_power_consumption.txt'))