# read data
powerData <- read.table('household_power_consumption.txt', sep=';',
                        header=T, 
                        colClasses = 
                          c('character', 'character','numeric', 'numeric', 
                            'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), 
                        na.strings='?')


powerData$DateTime <- strptime(paste(powerData$Date, data$Time), "%d/%m/%Y %H:%M:%S")

powerData <- subset(powerData, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))


# plot
png("plot4.png", height=480, width=480)

par(mfrow=c(2,2))

plot(powerData$DateTime, powerData$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")

lines(powerData$DateTime, powerData$Global_active_power)

plot(powerData$DateTime, powerData$Voltage, ylab="Voltage", xlab="datetime", pch=NA)

lines(powerData$DateTime, powerData$Voltage)

plot(powerData$DateTime, powerData$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")

# Draw the lines
lines(powerData$DateTime, powerData$Sub_metering_1, col='black')
lines(powerData$DateTime, powerData$Sub_metering_2, col='red')
lines(powerData$DateTime, powerData$Sub_metering_3, col='blue')

# Draw the summary
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')

# Global reactive power plot
with(powerData, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(powerData, lines(DateTime, Global_reactive_power))

# Close PNG file
dev.off()
