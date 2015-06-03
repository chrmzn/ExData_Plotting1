# To avoid what I would argue is unnecessary code duplication the source file 
# contains two helper functions:
#     processData() - Get the dataframe from the file and returns it
#     plotGraph() - Takes a filename, the function to generate the plot and
#                   the data.frame to create the plot
source('helper_functions.R')

plot1 <- function( df ){
  # Plot a histogram with the default buckets, a title, red colour and
  # a label on the x axis
  hist(df$Global_active_power, 
       main = "Global Active Power", 
       col = 'red', 
       xlab = 'Global Active Power (kilowatts)')
}

# As described above plot the graph
plotGraph('plot1.png', plot1, processData('household_power_consumption.txt'))
