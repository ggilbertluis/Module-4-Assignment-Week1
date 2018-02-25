library(data.table)
data<- read.table("HPC.txt", sep = ";", header = TRUE)
data<- as.data.table(data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ])

data$Global_active_power<- as.numeric(as.character(data$Global_active_power))

png("plot1.png")
hist(data$Global_active_power, col = "#FF2500",  ylim = c(0,1200), main = "Global Active Power", breaks = 12, xlab = "Global Active Power (kilowatts)" )
dev.off()