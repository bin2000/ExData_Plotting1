# 2
# read data
powerData <- read.table(file="household_power_consumption.txt", 
                        sep=";", header = TRUE, stringsAsFactors = FALSE)

# only need data from 2 days
powerData2Days <- rbind(subset(powerData, Date == "1/2/2007"),
                        subset(powerData, Date == "2/2/2007"))

# plot
png(filename="plot2.png", width = 480, height = 480, units = "px")


with(powerData2Days, plot(Global_active_power,type="l", xaxt="n", ylab="Global Active Power (kilowatts)", xlab=""))

axis(1,c(1,nrow(powerData2Days)/2, nrow(powerData2Days)),c("Thu","Fri","Sat"))

dev.off()