setwd("~/Coursera/Exploratory Data Analysis")

library(data.table)

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
vars <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
chartDat <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02", select = c("Date", "Time", vars))

chartDat$Time <- strptime(paste(chartDat$Date, chartDat$Time), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(chartDat$Time
   , chartDat$Sub_metering_1
   , col = "black"
   , type = "l"
   , xlab = ""
   , ylab = "Energy sub metering"
   , ylim = c(0, max(chartDat[vars])))

lines(chartDat$Time
    , chartDat$Sub_metering_2
    , col = "red")

lines(chartDat$Time
    , chartDat$Sub_metering_3
    , col = "blue")

legend("topright"
     , vars
     , col = c("black", "red", "blue")
     , lty = c(1, 1, 1))

dev.off()