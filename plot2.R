library(data.table)
data<- read.table("HPC.txt", sep = ";", header = TRUE)
data<- as.data.table(data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ])

data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
DateTime <- paste(data$Date, data$Time)
data$Date <- as.POSIXct(DateTime, format="%Y-%m-%d %H:%M:%S")

data$Global_active_power<- as.numeric(as.character(data$Global_active_power))

png("plot2.png")
plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" )
dev.off()