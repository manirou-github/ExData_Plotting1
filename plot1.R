library(readr)
library(dplyr)
library(lubridate)

data <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, 
                   col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)

data <- filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename="plot1.png", width = 480, height = 480)

hist(x = data$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global_active_power(Kilowatts)")

dev.off()













