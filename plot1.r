#plot1.r
# Creates the Global_active_power histogram

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
plotelectricity <- electricity[electricity$datetime >= '2007-02-01' & electricity$datetime <= '2007-02-02',]



# Create plot 1, the Global Active Power histogram

png(file = 'plot1.png', width = 480, height = 480, units = "px")

with(plotelectricity, hist(Global_active_power, 
                           col = "red", 
                           main = "Gobal Active Power", 
                           xlab = "Global Active Power (kilowatts)", 
                           ylab = "Frequency"))
# TODO: Fix the escape character problem with the brackets
dev.off()
