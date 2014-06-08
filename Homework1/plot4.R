DF <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
DF[,1]<-as.Date(DF$Date,"%d/%m/%Y")
DF2<-subset(DF,DF[,1]=="2007-02-01")
DF3<-subset(DF,DF[,1]=="2007-02-02")
DF<-rbind(DF2,DF3)
par(mfrow=c(2,2))
## plot 1
plot(ts(DF$Global_active_power),xaxt='n',yaxt='n',xlab="",ylab="Global Active Power")
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,nrow(DF)/2,nrow(DF)))
axis(side=2,labels=c(0,2,4,6),at=c(0,1000,2000,3000))
## plot 2
plot(ts(DF$Voltage),xaxt='n',yaxt='n',xlab="datetime",ylab="Voltage")
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,nrow(DF)/2,nrow(DF)))
axis(side=2,labels=c(234,236,238,240,242,244,246),at=c(800,1033,1266,1499,1732,1965,2200))
## plot 3
plot(ts(as.numeric(DF$Sub_metering_1)-2),xaxt='n',yaxt='n',xlab="",ylab="Energy sub metering",ylim=range(0,DF$Sub_metering_2,DF$Sub_metering_1,DF$Sub_metering_3))
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,nrow(DF)/2,nrow(DF)))
axis(side=2,labels=c(0,10,20,30),at=c(0,10,20,30))
lines(ts(as.numeric(DF$Sub_metering_2)-2),col="red")
lines(ts(as.numeric(DF$Sub_metering_3)),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2,lty=1)

## plot 4
plot(ts(DF$Global_reactive_power),xaxt='n',yaxt='n',xlab="datetime",ylab="Global_reactive_power")
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,nrow(DF)/2,nrow(DF)))
axis(side=2,labels=c(0.0,0.1,0.2,0.3,0.4,0.5),at=c(2,47.6,93.2,138.8,184.4,230))

## output
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()