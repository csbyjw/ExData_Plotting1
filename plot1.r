# Coursera Exploratory Data Analysis - Assignment 1 - Plot 1
# 'household_power_consumption_small.txt' in the working directory.

setwd("~/Documents/Coursera/Data Science/code/ExData_Plotting1")

# download zip file and save to current working directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="temp.zip", method="curl")

# extract the zip file
unzip("temp.zip")

inputdata <- read.table('household_power_consumption.txt', skip = 66637, nrow = 2880, sep = ";", na.strings="?",
              col.names = colnames(read.table('household_power_consumption.txt', nrow = 1, header = TRUE, sep=";"))) 

## Date and Time converted from factor to character 
for( i in 1:2) {
  inputdata[, i] <- as.character(inputdata[, i])
}


with(inputdata, hist(Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power"))
dev.copy(png,file="plot1.png")
dev.off()
