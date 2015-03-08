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


# import as a R data frame  

electricity <- read.table('./household_power_consumption.txt', header=FALSE, skip=66637,nrow=2880, sep=";", na.strings="?",
                          col.names=c('Date', 'Time', 'Global_active_power', 'Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3'))

# Convert Date and Time into POSIX values
electricity$datetime <- strptime(paste(electricity$Date, electricity$Time), "%d/%m/%Y %H:%M:%S")



# Plot 4 the array of graphs
png(file = 'plot4.png', width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
with(electricity, plot(datetime, Global_active_power, type='l', 
                             xlab="", ylab="Global Active Power (kilowatts)"))
with(electricity, plot(datetime, Voltage, type = "l", xlab= "datetime", ylab="Voltage"))

with(electricity, plot(datetime, Sub_metering_1, type = "l", col="black", 
       xlab = "", ylab = "Energy sub metering"))
lines(electricity$datetime, electricity$Sub_metering_2, type = "l", col="red")
  lines(electricity$datetime, electricity$Sub_metering_3, type = "l", col="blue")
  legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
with(electricity,plot(datetime,Global_reactive_power, type = "l", xlab="datetime"))
dev.off()