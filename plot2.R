setwd("~/Coursera/Exploratory Data Analysis")

library(data.table)

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
chartDat <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02", select = c("Date", "Time", "Global_active_power"))

chartDat$Time <- strptime(paste(chartDat$Date, chartDat$Time), "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(chartDat$Time
   , chartDat$Global_active_power
   , type = "l"
   , xlab = ""
   , ylab = "Global Active Power (kilowatts)")

dev.off()