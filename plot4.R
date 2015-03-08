# setwd('C:\\Users\\sdey\\Documents\\Desk\\Sekha\\R\\ExploratoryAnalysis\\Week1')
# Coursera Exploratory Data Analysis Week 1 - Project
# Plot 2
# 

# Download and unzip the file if it is not there
if (!file.exists("./data/data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="./data/data.zip")
  unzip("./data/data.zip")  
}

#  load the data from the downloaded text file only if the fileData is not loaded
if (! exists("fileData")) {
  fileData <- read.table('.\\data\\household_power_consumption.txt', header = TRUE, na.strings = '?', sep = ';')
}
# Format the date column into a new column
fileData$formattedDate <- as.Date(fileData$Date,"%d/%m/%Y")

# use data from the dates 2007-02-01 and 2007-02-02
powerCompData <- subset(fileData, formattedDate == "2007-02-01" | formattedDate == "2007-02-02")

powerCompData$DateTime <- as.POSIXct(paste(powerCompData$Date, powerCompData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
powerCompData$DayOfWeek <- format(powerCompData$formattedDate, "%a")

# Now draw the plot
png(filename="./data/plot4.png", width=480, height=480)
# set space for 2 x 2 
par(mfrow = c(2,2))

# plot 1
plot(powerCompData$DateTime, powerCompData$Global_active_power, type="l",col="black", xlab="", ylab="Global Active Power", main="")

# plot 2
plot(powerCompData$DateTime, powerCompData$Voltage, type="l",col="black", xlab="datetime", ylab="Voltage", main="")

# plot 3
plot(powerCompData$DateTime, powerCompData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering", main="")
lines(powerCompData$DateTime, powerCompData$Sub_metering_2, col="red")
lines(powerCompData$DateTime, powerCompData$Sub_metering_3, col="blue")
# Add legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1, lty=1, bty="n")

# plot 4
plot(powerCompData$DateTime, powerCompData$Global_reactive_power, type="l",col="black", xlab="datetime", ylab="Global_reactive_power", main="")

dev.off()
