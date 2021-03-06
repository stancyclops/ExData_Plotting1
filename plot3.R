
file = "./exdata-data-household_power_consumption/household_power_consumption.txt"

alldata <- read.csv2(file,na.strings="?",stringsAsFactors=FALSE)

alldata1 <- alldata[66637:69516,]

alldata2 <- cbind(DateTime=0,alldata1)

alldata2$DateTime <- paste(alldata2$Date,alldata2$Time)

alldata2$DateTime <- strptime(alldata2$DateTime,format= "%d/%m/%Y %H:%M:%S")

alldata2$Global_active_power <- as.numeric(alldata2$Global_active_power)

png(filename = "plot3.png",width=480,height=480)

plot(alldata2$DateTime,alldata2$Sub_metering_1,type="s",xlab="",ylab="Energy sub metering")
lines(alldata2$DateTime,alldata2$Sub_metering_2,type="s",col="red")
lines(alldata2$DateTime,alldata2$Sub_metering_3,type="s",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()