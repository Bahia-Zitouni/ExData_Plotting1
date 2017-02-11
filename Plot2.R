# Read Local files 

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", quote = "")

# convert date and time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

rm(data)

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

## Plot 2
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(df$Global_active_power, df$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

