library(data.table)

data<- read.table("HPC.txt", sep = ";", header = TRUE)
data<- as.data.table(data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ])

data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
DateTime <- paste(data$Date, data$Time)
data$Date <- as.POSIXct(DateTime, format="%Y-%m-%d %H:%M:%S")

data$Sub_metering_1<- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<- as.numeric(as.character(data$Sub_metering_3))


png("plot3.png")
plot(data$Date, data$Sub_metering_1, type = "l",  col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_2, type = "l", col = "red")
lines(data$Date, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty = 1, cex=0.8)
dev.off()