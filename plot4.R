#Read data
data<-read.table(file="household_power_consumption.txt", header = TRUE, sep=";")
data$Date<-strptime(data$Date, format="%d/%m/%Y")
filteredData <-data[data$Date>=strptime("1/2/2007", format="%d/%m/%Y") & data$Date<=strptime("2/2/2007", format="%d/%m/%Y"),]
filteredData$dt <- strptime(paste(as.character(filteredData$Date), as.character(filteredData$Time)), format="%Y-%m-%d %H:%M:%S")

#Init device
png(file="plot4.png",  bg = "transparent")

# 2x2 Matrix
par(mfcol=c(2,2)) 

#Plot 1
plot(filteredData$dt, as.numeric(as.character(filteredData$Global_active_power)), type="l", ylab="Global Active Power",xlab="")

#Plot 2
plot(filteredData$dt, as.numeric(as.character(filteredData$Sub_metering_1)), type="n", ylab="Energy sub metering", xlab="")
lines(filteredData$dt, as.numeric(as.character(filteredData$Sub_metering_1)))
lines(filteredData$dt, as.numeric(as.character(filteredData$Sub_metering_2)), col="red")
lines(filteredData$dt, as.numeric(as.character(filteredData$Sub_metering_3)), col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")

#Plot 3
plot(filteredData$dt, as.numeric(as.character(filteredData$Voltage)), type="l", ylab="Voltage",xlab="datetime")

#Plot 4
plot(filteredData$dt, as.numeric(as.character(filteredData$Global_reactive_power)), type="l", ylab="Global_reactive_power",xlab="datetime")

#Close device
dev.off()