#read and combined data until neaty and ready for ploting
data <- read.csv(file="household_power_consumption.txt", sep=";")
Date <- as.Date(data[,1], "%d/%m/%Y")
data2 <- data[,c(2,3,4,5,6,7,8,9)]
newData <- cbind(Date,data2)
subData <- subset(newData,Date=="2007-02-01" | Date=="2007-02-02")
#data ready and start ploting data
png("plot1.png", width=480, height=480)
hist(as.numeric(subData[,3]),xlab="Global Active Power(kilowatts)", ylab="Frequency", main="Global Active Power", col="red")
dev.off()