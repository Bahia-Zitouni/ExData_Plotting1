# Read Local files 

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", quote = "")

# convert date and time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

rm(data)

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

# Plot 1 
hist(df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

