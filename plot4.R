# Reading in data and putting into useful format
#
setwd("~/Desktop/Coursera")
library(sqldf)

file_name <- "household_power_consumption.txt"
data <- read.csv.sql(file_name, sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
head(data) # a check on the data



# Creating fourth plot
#
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type = 'l', xlab='', ylab = 'Global Active Power', main = '')
plot(data$DateTime, data$Voltage, type = 'l', xlab='datetime', ylab = 'Voltage', main = '')
with(data, plot(DateTime, Sub_metering_1, xlab = '', ylab = 'Energy sub metering', main ='', type = 'n'))
with(data, lines(DateTime, Sub_metering_1, col = 'black'))
with(data, lines(DateTime, Sub_metering_2, col = 'red'))
with(data, lines(DateTime, Sub_metering_3, col = 'blue'))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
plot(data$DateTime, data$Global_reactive_power, type = 'l', xlab='datetime', ylab = 'Global Reactive Power', main = '')
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()
