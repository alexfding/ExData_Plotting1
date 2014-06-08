#read and combined data until neaty and ready for ploting
data <- read.csv(file="household_power_consumption.txt", sep=";")
Date <- as.Date(data[,1], "%d/%m/%Y")
data2 <- data[,c(2,3,4,5,6,7,8,9)]
newData <- cbind(Date,data2)
subData <- subset(newData,Date=="2007-02-01" | Date=="2007-02-02")
x <- paste(subData$Date,subData$Time)
time <- strptime(x, "%Y-%m-%d %H:%M:%S")
power <- subData[,3]
#data ready and start ploting data
png("plot2.png", width=480, height=480)
plot(x<-time,y<-as.numeric(as.character(power)),type="l",xlab="", ylab="Global Active Power(kilomatts)")
dev.off()