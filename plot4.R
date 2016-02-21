# Global Active Power
# Change the working dir to your owns
# setwd("/Users/liulu/Code/R/ExData_Plotting1")

dataFileName <- "./resource/household_power_consumption.txt"
data <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
subMeteringOne <- as.numeric(subSetData$Sub_metering_1)
subMeteringTwo <- as.numeric(subSetData$Sub_metering_2)
subMeteringThree <- as.numeric(subSetData$Sub_metering_3)
voltage <- as.numeric(subSetData$Voltage)

png("figure/plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type="l", ylab="Global Active Power", xlab="", cex=0.2)

plot(datetime, voltage, type="l", ylab="Voltage");

plot(datetime, subMeteringOne, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeteringTwo, type="l", col="red")
lines(datetime, subMeteringThree, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", ylab="Global_reactive_power")

dev.off()
