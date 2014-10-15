# 1
# read data
powerData <- read.table(file="household_power_consumption.txt", 
                         sep=";", header = TRUE, stringsAsFactors = FALSE)

# only need data from 2 days
powerData2Days <- rbind(subset(powerData, Date == "1/2/2007"),
                        subset(powerData, Date == "2/2/2007"))

# plot
png(filename="plot1.png", width = 480, height = 480, units = "px")

hist(as.numeric(powerData2Days$Global_active_power), 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")

dev.off()

