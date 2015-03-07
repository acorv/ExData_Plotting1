#Read data
data<-read.table(file="household_power_consumption.txt", header = TRUE, sep=";")
data$Date<-strptime(data$Date, format="%d/%m/%Y")
filteredData <-data[data$Date>=strptime("1/2/2007", format="%d/%m/%Y") & data$Date<=strptime("2/2/2007", format="%d/%m/%Y"),]

#Init device
png(file="plot1.png")

hist(as.numeric(as.character(filteredData$Global_active_power)), breaks=15, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200), col="red")

#Close device
dev.off()
