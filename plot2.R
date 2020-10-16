library(readr)
library(dplyr)
library(lubridate)

data <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, 
                   col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)

data <- filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename="plot2.png", width = 480, height = 480)

with(data, plot(as_datetime(paste(data$Date,data$Time)), Global_active_power, type = "l", xlab = "", ylab = "Global_active_power(Kilowatts)" ))

dev.off()