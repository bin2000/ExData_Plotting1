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
png("plot2.png", height=480, width=480)

plot(powerData$DateTime, powerData$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")

lines(powerData$DateTime, data$Global_active_power)

dev.off()
