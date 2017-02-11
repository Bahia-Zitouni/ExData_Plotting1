# reading relevant data

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", quote = "")

# convert date and time variables
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

rm(data)

# subsetting data and converting variables into numeric
df <- df %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V7 = as.numeric(as.character(V7)),
                        V8 = as.numeric(as.character(V8)),
                        V9 = as.numeric(as.character(V9))) %>% select(V1,V7:V9)

# create plot
with(df, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(df, points(V1,V7, col="black", type="l"))
with(df, points(V1,V8, col="red", type="l"))
with(df, points(V1,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

## Saving to PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
