setwd("~/Coursera/Exploratory Data Analysis")

library(data.table)

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
chartDat <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02")

chartDat$datetime <- strptime(paste(chartDat$Date, chartDat$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# one
plot(chartDat$datetime
     , chartDat$Global_active_power
     , type = "l"
     , xlab = ""
     , ylab = "Global Active Power")

# two
with(chartDat, plot(datetime
                  , Voltage
                  , type = "l"))
# three
vars <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(chartDat$datetime
     , chartDat$Sub_metering_1
     , col = "black"
     , type = "l"
     , xlab = ""
     , ylab = "Energy sub metering"
     , ylim = c(0, max(chartDat[vars])))

lines(chartDat$datetime
      , chartDat$Sub_metering_2
      , col = "red")

lines(chartDat$datetime
      , chartDat$Sub_metering_3
      , col = "blue")

legend("topright"
       , vars
       , col = c("black", "red", "blue")
       , lty = c(1, 1, 1)
       , bty = "n")

#four
with(chartDat, plot(datetime
             , Global_reactive_power
             , type = "l"))

dev.off()