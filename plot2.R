# Reading in data and putting into useful format
#
setwd("~/Desktop/Coursera")
library(sqldf)

file_name <- "household_power_consumption.txt"
data <- read.csv.sql(file_name, sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
head(data) # a check on the data



# Creating second plot
#
plot(data$DateTime,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kW)", main = "")
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
