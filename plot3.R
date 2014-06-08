#read and combined data until neaty and ready for ploting
data <- read.csv(file="household_power_consumption.txt", sep=";")
Date <- as.Date(data[,1], "%d/%m/%Y")
data2 <- data[,c(2,3,4,5,6,7,8,9)]
newData <- cbind(Date,data2)
subData <- subset(newData,Date=="2007-02-01" | Date=="2007-02-02")
x <- paste(subData$Date,subData$Time)
Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
data3 <- subData[,c(3,4,5,6,7,8,9)]
plotData <- cbind(Time,data3)
#data ready and start ploting data
png("plot3.png", width=480, height=480)
with(plotData,plot(plotData$Time,as.numeric(as.character(plotData[,6])),type="l",xlab="", ylab="Energy sub metering"))
with(plotData,lines(plotData$Time,as.numeric(as.character(plotData[,7])), col="red"))
with(plotData,lines(plotData$Time,as.numeric(as.character(plotData[,8])), col="blue"))
legend("topright",lty=c(1,1,1),col=c("black","red","blue"), bty="n",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()