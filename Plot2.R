
library(data.table)

#Download data for the project
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./data/exploreDataProject1.zip")

#unzip files 
unzip("./data/exploreDataProject1.zip", files = NULL, exdir="./data")

#Read in data 
rawData <- read.table("./data/household_power_consumption.txt", header = TRUE, na.strings="?", sep=";")

data <- rawData[(rawData$Date=="1/2/2007" | rawData$Date == "2/2/2007"),]

#format date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

plot(data$Global_active_power~data$DateTime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

#export file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()