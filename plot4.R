# 4
# read data
powerData <- read.table(file="household_power_consumption.txt", 
                        sep=";", header = TRUE, stringsAsFactors = FALSE)

# only need data from 2 days
powerData2Days <- rbind(subset(powerData, Date == "1/2/2007"),
                        subset(powerData, Date == "2/2/2007"))

# plot
# start plotting
png(filename="plot4.png", width = 480, height = 480, units = "px")

# multiple plots
par(mfrow=c(2,2))

# plot 1
with(powerData2Days, plot(Global_active_power,type="l", xaxt="n", ylab="Global Active Power (kilowatts)", xlab=""))
axis(1,c(1,nrow(powerData2Days)/2, nrow(powerData2Days)),c("Thu","Fri","Sat"))

# plot 2
with(powerData2Days, plot(Voltage,type="l", xaxt="n", ylab="Voltage", xlab="datetime"))
axis(1,c(1,nrow(powerData2Days)/2, nrow(powerData2Days)),c("Thu","Fri","Sat"))

# plot 3
with(powerData2Days, plot(Sub_metering_1,type="l", xaxt="n", ylab="Energy sub metering", xlab=""))
with(powerData2Days, lines(Sub_metering_2, col="red"))
with(powerData2Days, lines(Sub_metering_3, col="blue"))
axis(1,c(1,nrow(powerData2Days)/2, nrow(powerData2Days)),c("Thu","Fri","Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1, border="white", cex=1)

# plot 4
with(powerData2Days, plot(Global_reactive_power,type="l", xaxt="n", xlab="datetime"))
axis(1,c(1,nrow(powerData2Days)/2, nrow(powerData2Days)),c("Thu","Fri","Sat"))
dev.off()
