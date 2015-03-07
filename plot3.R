#Read data
data<-read.table(file="household_power_consumption.txt", header = TRUE, sep=";")
data$Date<-strptime(data$Date, format="%d/%m/%Y")
filteredData <-data[data$Date>=strptime("1/2/2007", format="%d/%m/%Y") & data$Date<=strptime("2/2/2007", format="%d/%m/%Y"),]
filteredData$dt <- strptime(paste(as.character(filteredData$Date), as.character(filteredData$Time)), format="%Y-%m-%d %H:%M:%S")

#Init device
png(file="plot3.png", bg = "transparent")

plot(filteredData$dt, as.numeric(as.character(filteredData$Sub_metering_1)), type="n", ylab="Energy sub metering", xlab="")
lines(filteredData$dt, as.numeric(as.character(filteredData$Sub_metering_1)))
lines(filteredData$dt, as.numeric(as.character(filteredData$Sub_metering_2)), col="red")
lines(filteredData$dt, as.numeric(as.character(filteredData$Sub_metering_3)), col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)

#Close device
dev.off() 
