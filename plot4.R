##read data into R

data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";", na.strings="?")

##Format Date column

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

##Subset by date: 2007-02-01 and 2007-02-02

data <- subset(data, data$Date >= as.Date("2007-02-01") )
data <- subset(data, data$Date <= as.Date("2007-02-02") )

##define class

data$Time<-paste(data$Date,data$Time,sep="")
data$Time<-strptime(data$Time,format = "%Y-%m-%d %H:%M:%S")

##Replicate plot 4

png("plot4.png",width=480, height=480, units="px")
par(mfrow=c(2,2))

##top left quadrant (c (1,1))

plot(data$Time,data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

##top right quadrant (c (1,2))

plot(data$Time,data$Voltage, type="l", ylab="Global Active Power", xlab="datetime")

##bottom left quadrant (c (2,1)

plot(data$Time,data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(x = data$Time,y = data$Sub_metering_1,lty="solid")
lines(x = data$Time,y = data$Sub_metering_2,lty="solid", col="red")
lines(x = data$Time,y = data$Sub_metering_3,lty="solid", col="blue")
legend("topright",lty = "solid", col = c("black","blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##bottom right quadrant (c(2,2))

plot(data$Time,data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

##Close

dev.off()