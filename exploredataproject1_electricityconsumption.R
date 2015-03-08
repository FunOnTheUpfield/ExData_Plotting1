# exploredataproject1_electricityconsumption.R
# by Simon Stainsby
# Written 7-8 March 2015 as a course project for
# https://class.coursera.org/exdata-012/


# Depreciated: USE SCRIPTS plot1.R through plot4.R
# THIS PARTIALLY COMPLETED SCRIPT WAS ABANDONED.




# Create a data directory if needed

if(!file.exists("data")){
  dir.create("data")
}

# Download and unzip sourse file from internet
if(!file.exists('./household_power_consumption.txt')){
  fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileurl,
                './data/electricity.zip', 
                method = "wget",
                mode = "wb")
  unzip('./data/electricity.zip')
  rm(fileurl)
}
# TODO: Write a check to see if the file is too big for the host machine as per instructions.


# import as a R data frame  

txtelectricity <- read.table('./household_power_consumption.txt', header = TRUE, sep=";", na.strings="?", nrows = 100)
classes <- sapply(txtelectricity, class)
electricity <- read.table('./household_power_consumption.txt', header = TRUE, sep=";",na.strings="?", colClasses=classes)
rm(txtelectricity, classes)

# Convert Date and Time into POSIX values
#library(lubridate)
#electricity$Date <- dmy(electricity$Date)
#electricity$Time <- hms(electricity$Time)
electricity$datetime <- strptime(paste(electricity$Date, electricity$Time), "%d/%m/%Y %H:%M:%S")

# Subset electricity consumption for dates 2007-02-01 and 2007-02-02.
plotelectricity <- electricity[electricity$datetime >= '2007-02-01' & electricity$datetime <= '2007-02-02',]

library(datasets)
# Create plot 1, the Global Active Power histogram

png(file = 'plot1.png', width = 480, height = 480, units = "px")

with(plotelectricity, hist(Global_active_power, 
                           col = "red", 
                           main = "Gobal Active Power", 
                           xlab = "Global Active Power (kilowatts)", 
                           ylab = "Frequency"))
# TODO: Fix the escape character problem with the brackets
dev.off()


# Plot 2, the Global Active Power line graph with days of week x axis
png(file = 'plot2.png', width = 480, height = 480, units = "px")
with(plotelectricity, plot(datetime, Global_active_power, type = "l", 
                           ylab = "Global Active Power (kilowatts)", xlab=""))
    
dev.off()

# TODO:  add days of week to x axis, label to y axis


# Plot 3 Sub Metering
png(file = 'plot3.png', width = 480, height = 480, units = "px")
with(plotelectricity, plot(Sub_metering_1, type = "l"))
with(plotelectricity, plot(Sub_metering_2, type = "l")) 
with(plotelectricity, plot(Sub_metering_3, type = "l"))
dev.off()

# TODO: Replace Dots with rectangles, colour submetering 2 blue, colour submetering 3 red, 
#       add x and y axis information, add legend

# Plot 4 the array of graphs
png(file = 'plot4.png', width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(plotelectricity, {
  plot(Voltage, type = "l")
  plot(Global_active_power, type = "l", 
                             ylab = "Global Active Power \\(kilowatts\\)")
  
  plot(Sub_metering_1, type = "l")
  plot(Global_reactive_power, type = "l")
  })
dev.off()