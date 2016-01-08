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

##Replicate plot 1
 
png("plot1.png",width=480, height=480, units="px")
hist(data$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowats)", col="red")
dev.off()