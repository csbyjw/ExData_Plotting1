# Coursera Exploratory Data Analysis - Assignment 1 - Plot 3
# 'household_power_consumption_small.txt' in the working directory.

setwd("~/Documents/Coursera/Data Science/code/ExData_Plotting1")

# download zip file and save to current working directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="temp.zip", method="curl")

# extract the zip file
unzip("temp.zip")

inputdata <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", na.strings="?", 
              col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE, sep=";"))) 

## Date and Time converted from factor to character 
for( i in 1:2) {
  inputdata[, i] <- as.character(inputdata[, i])
}
inputdata <- within(inputdata, DateTime <- paste(Date, Time, sep = ' '))
inputdata$DateTime <- strptime(paste(inputdata$Date, inputdata$Time), format="%d/%m/%Y %H:%M:%S")

xrange <- range(inputdata$DateTime) 
yrange <- range(c(inputdata$Sub_metering_1,inputdata$Sub_metering_2,inputdata$Sub_metering_3))

plot(xrange,yrange, ylab="Energy sub metering",xlab="",type="n")
lines(inputdata$DateTime,inputdata$Sub_metering_1,col="black")
lines(inputdata$DateTime,inputdata$Sub_metering_2,col="red")
lines(inputdata$DateTime,inputdata$Sub_metering_3,col="blue")
legend("topright", col=c("black", "blue", "red"), cex = 0.95, lty=1,
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()