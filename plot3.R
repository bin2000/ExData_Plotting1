# 3
# read data
powerData <- read.table(file="household_power_consumption.txt", 
                        sep=";", header = TRUE, stringsAsFactors = FALSE)

# only need data from 2 days
powerData2Days <- rbind(subset(powerData, Date == "1/2/2007"),
                        subset(powerData, Date == "2/2/2007"))
# plot
png(filename="plot3.png", width = 480, height = 480, units = "px")

with(powerData2Days, plot(Sub_metering_1,type="l", xaxt="n", ylab="Energy sub metering", xlab=""))

with(powerData2Days, lines(Sub_metering_2, col="red"))

with(powerData2Days, lines(Sub_metering_3, col="blue"))

axis(1,c(1,nrow(powerData2Days)/2, nrow(powerData2Days)),c("Thu","Fri","Sat"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1, cex=1)

dev.off()