setwd("~/Coursera/Exploratory Data Analysis")

library(data.table)

dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
chartDat <- subset(dat, Date == "2007-02-01" | Date == "2007-02-02", select = c("Date", "Time", "Global_active_power"))

png("plot1.png", width = 480, height = 480)

hist(chartDat$Global_active_power
   , col = "red"
   , main = "Global Active Power"
   , xlab = "Global Active Power (kilowatts)")

dev.off()