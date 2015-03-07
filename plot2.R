#Read data
data<-read.table(file="household_power_consumption.txt", header = TRUE, sep=";")
data$Date<-strptime(data$Date, format="%d/%m/%Y")
filteredData <-data[data$Date>=strptime("1/2/2007", format="%d/%m/%Y") & data$Date<=strptime("2/2/2007", format="%d/%m/%Y"),]
filteredData$dt <- strptime(paste(as.character(filteredData$Date), as.character(filteredData$Time)), format="%Y-%m-%d %H:%M:%S")

#Init device
png(file="plot2.png", bg = "transparent")

plot(filteredData$dt, as.numeric(as.character(filteredData$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)",xlab="")

#Close device
dev.off()

