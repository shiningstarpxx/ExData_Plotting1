# Global Active Power
# Change the working dir to your owns
# setwd("/Users/liulu/Code/R/ExData_Plotting1")

dataFileName <- "./resource/household_power_consumption.txt"
data <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMeteringOne <- as.numeric(subSetData$Sub_metering_1)
subMeteringTwo <- as.numeric(subSetData$Sub_metering_2)
subMeteringThree <- as.numeric(subSetData$Sub_metering_3)

png("figure/plot3.png", width=480, height=480)
plot(datetime, subMeteringOne, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeteringTwo, type="l", col="red")
lines(datetime, subMeteringThree, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
