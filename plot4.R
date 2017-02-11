data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# clearing name row and unrelevant variables, casting to right classes
df <- data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V3 = as.numeric(as.character(V3)),
                        V4 = as.numeric(as.character(V4)),
                        V5 = as.numeric(as.character(V5)),
                        V7 = as.numeric(as.character(V7)),
                        V8 = as.numeric(as.character(V8)),
   
                    
                                     V9 = as.numeric(as.character(V9)))


# create plot
par(mfrow = c(2, 2))

with(df, plot(V1,V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

with(df, plot(V1,V5, type="l", xlab = "datetime", ylab = "Voltage"))

with(df, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(df, points(V1,V7, col="black", type="l"))
with(df, points(V1,V8, col="red", type="l"))
with(df, points(V1,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

with(data, plot(V1,V4, type="l", xlab = "datetime", ylab = "Global_reactive_power"))

## Saving to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()