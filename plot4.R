
# load the data from my local project folder after I have unzipped the .zip file
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?")

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

datetime <- strptime(paste(data_to_use$Date, data_to_use$Time, sep =), "%d/%m/%Y %H:%M:%S") 

# subset the data to use only the ones for 2007-02-01 and 2007-02-02
data_to_use <- subset(x = data, Date == "2007-02-01" | Date == "2007-02-02")

png(filename = "plot4.png", height = 480, width = 480, units = "px")

par(mfrow = c(2,2))

# plot chart 1 out of 4
plot(data_to_use$Time, data_to_use$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")

# plot chart 2 out of 4
plot(data_to_use$Time, data_to_use$Voltage, type = "l",
     ylab = "Voltage", xlab = "datetime")

# plot chart 3 out of 4
plot(data_to_use$Time, data_to_use$Sub_metering_1, col = "black", type  = "l",
     main = "", xlab = "", ylab = "Energy sub metering")

lines(x = data_to_use$Time, y = data_to_use$Sub_metering_2, col = "red")
lines(x = data_to_use$Time, y = data_to_use$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot chart 4 out of 4
plot(data_to_use$Time, data_to_use$Global_reactive_power, type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()