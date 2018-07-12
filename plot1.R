# Reading in data and putting into useful format
#
setwd("~/Desktop/Coursera")
library(sqldf)

file_name <- "household_power_consumption.txt"
data <- read.csv.sql(file_name, sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
head(data) # a check on the data



# Creating first plot
#
hist(data$Global_active_power, col = 'red', xlab = "Global Active Power (kW)", main = "Global Active Power")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()
