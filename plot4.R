
library(data.table)
data<- read.table("HPC.txt", sep = ";", header = TRUE)
data<- as.data.table(data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ])

data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
DateTime <- paste(data$Date, data$Time)
data$Date <- as.POSIXct(DateTime, format="%Y-%m-%d %H:%M:%S")

data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_active_power<- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power<- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1<- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<- as.numeric(as.character(data$Sub_metering_3))

png("plot4.png",width = 480, height = 480)
par(mfrow=c(2, 2))
plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "" )
plot(data$Date, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime" )

plot(data$Date, data$Sub_metering_1, type = "l",  col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_2, type = "l", col = "red")
lines(data$Date, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty = 1, cex=0.8,bty="n")

plot(data$Date, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()




