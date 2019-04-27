

# load the data from my local project folder after I have unzipped the .zip file
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?")

data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

datetime <- strptime(paste(data_to_use$Date, data_to_use$Time, sep =), "%d/%m/%Y %H:%M:%S") 

# subset the data to use only the ones for 2007-02-01 and 2007-02-02
data_to_use <- subset(x = data, Date == "2007-02-01" | Date == "2007-02-02")

# Start creating the first plot
png(filename = "plot1.png", width = 480, height = 480, units = "px") 
with(data_to_use, hist(Global_active_power, main = "Global Active Power",
                       col = "red", xlab = "Global Active Power (kilowatts)"))

dev.off()