#plot4.r
# Creates the array of graphs.

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
electricity$datetime <- strptime(paste(electricity$Date, electricity$Time), "%d/%m/%Y %H:%M:%S")

# Subset electricity consumption for dates 2007-02-01 and 2007-02-02.
plotelectricity <- electricity[electricity$datetime <= '2007-02-02' & electricity$datetime >= '2007-02-01', ]




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