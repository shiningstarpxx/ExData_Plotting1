# Global Active Power
# Change the working dir to your owns
# setwd("/Users/liulu/Code/R/ExData_Plotting1")

# prepare data, common part in plot*.R
dataFileName <- "./resource/household_power_consumption.txt"
data <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

globalActivePower <- as.numeric(subSetData$Global_active_power)
png("figure/plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
