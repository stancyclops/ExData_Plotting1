

file = "./exdata-data-household_power_consumption/household_power_consumption.txt"

alldata <- read.csv2(file,na.strings="?",stringsAsFactors=FALSE)

alldata1 <- alldata[66637:69516,]

alldata2 <- cbind(DateTime=0,alldata1)

alldata2$DateTime <- paste(alldata2$Date,alldata2$Time)

alldata2$DateTime <- strptime(alldata2$DateTime,format= "%d/%m/%Y %H:%M:%S")

alldata2$Global_active_power <- as.numeric(alldata2$Global_active_power)

png(filename = "plot2.png",width=480,height=480)

plot(alldata2$DateTime,alldata2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()