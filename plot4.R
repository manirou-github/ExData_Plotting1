library(readr)
library(dplyr)
library(lubridate)

data <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, 
                   col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)

data <- filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")



png(filename="plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(data, plot(as_datetime(paste(data$Date,data$Time)), Global_active_power, type = "l", xlab = "", ylab = "Global active power" ))


with(data, plot(as_datetime(paste(data$Date,data$Time)), Voltage, type = "l", xlab = "", ylab = "Voltage" ))


with(data, 
     {plot(as_datetime(paste(data$Date,data$Time)), Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering" )
       points(as_datetime(paste(data$Date,data$Time)), data$Sub_metering_2, type = "l",col = "red")
       points(as_datetime(paste(data$Date,data$Time)), data$Sub_metering_3, type = "l",col = "blue")
       legend("topright",bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","blue","red") )})


with(data, plot(as_datetime(paste(data$Date,data$Time)), Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power" ))

dev.off()
