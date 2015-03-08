# setwd('C:\\Users\\sdey\\Documents\\Desk\\Sekha\\R\\ExploratoryAnalysis\\Week1')
# Coursera Exploratory Data Analysis Week 1 - Project
# Plot 1
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

# Now draw the plot
png(filename="./data/plot1.png", width=480, height=480)
hist(powerCompData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.off()
