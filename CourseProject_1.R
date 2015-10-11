data <- read.table('./household_power_consumption.txt', skip = 66637, nrow = 2880, sep = ";" )
data[[1]] <- as.Date(data[[1]], format="%d/%m/%Y")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Plot1
jpeg('plot1.png')
hist(data[[3]], right=FALSE, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

data$day <- weekdays(as.Date(data$Date))
data$CurrentDate <- as.POSIXct(paste(data[[1]], data[[2]]), format = "%Y-%m-%d %H:%M:%S")

#Plot2
jpeg('plot2.png')
plot(data[[11]], data[[3]], type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()

#Plot3
jpeg('plot3.png')
plot(data[[11]], data[[7]],  type = "l", col="black", xlab = "", ylab = "Energy sub metering")
lines(data[[11]], data[[8]], type = "l", col="red")
lines(data[[11]], data[[9]], type = "l", col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()

#Plot4
jpeg('plot4.png')
par(mfrow = c(2,2))
plot(data[[11]], data[[3]], type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
plot(data[[11]], data[[5]], type = "l", ylab="Voltage", xlab = "datetime")
plot(data[[11]], data[[7]],  type = "l", col="black", xlab = "", ylab = "Energy sub metering")
lines(data[[11]], data[[8]], type = "l", col="red")
lines(data[[11]], data[[9]], type = "l", col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
plot(data[[11]], data[[4]], type = "l", ylab="Global_reactive_power", xlab = "datetime")
dev.off()
