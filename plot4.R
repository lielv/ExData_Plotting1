data<-read.table("household_power_consumption.txt", header=T, sep=";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
d<-subset(data,data$DateTime>='2007-02-01'&data$DateTime<'2007-02-03')
s1<-as.numeric(as.character(d$Sub_metering_1))
s2<-as.numeric(as.character(d$Sub_metering_2))
s3<-as.numeric(as.character(d$Sub_metering_3))

gap<-as.numeric(as.character(d$Global_active_power))
vol<-as.numeric(as.character(d$Voltage))
grp<-as.numeric(as.character(d$Global_reactive_power))

png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

plot(d$DateTime,gap,type='n',xlab="",ylab='Global Active Power')
lines(d$DateTime,gap)

plot(d$DateTime,vol,type='n',xlab="datetime",ylab='Voltage')
lines(d$DateTime,vol)

plot(d$DateTime,s1,type='n',xlab="",ylab='Energy sub metering')
lines(d$DateTime,s1,col='black')
lines(d$DateTime,s2,col='red')
lines(d$DateTime,s3,col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

plot(d$DateTime,grp,type='n',xlab="datetime",ylab='Global_reactive_power')
lines(d$DateTime,grp)
dev.off()