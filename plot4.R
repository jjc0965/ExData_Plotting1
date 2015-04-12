data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

###########################################################################################

data2days<-subset(data, (Date=="1/2/2007")|(Date=="2/2/2007"))
data2days$Date<-as.Date(data2days$Date, format="%d/%m/%Y")
data2days$Day<-weekdays(as.Date(data2days$Date))
data2days$Datetime<-as.POSIXct(paste(data2days$Date, data2days$Time))

data2days$Global_active_power<-as.numeric(as.character(data2days$Global_active_power))
data2days$Sub_metering_1<-as.numeric(as.character(data2days$Sub_metering_1))
data2days$Sub_metering_2<-as.numeric(as.character(data2days$Sub_metering_2))
data2days$Sub_metering_3<-as.numeric(as.character(data2days$Sub_metering_3))
data2days$Voltage<-as.numeric(as.character(data2days$Voltage))
data2days$Global_reactive_power<-as.numeric(as.character(data2days$Global_reactive_power))

png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with (data2days, {
  plot(Global_active_power~Datetime, ylab="Global Active Power", xlab="", type="l")
  plot(Voltage~Datetime, ylab="Voltage", xlab="date/time", type="l")
  with(data2days, { 
    plot(Sub_metering_1~Datetime, xlab="", ylab="Energy sub metering", ylim=c(0,38), col="black", type="l") 
    lines(Sub_metering_2~Datetime, col="red") 
    lines(Sub_metering_3~Datetime, col="blue") 
  }) 
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7) 
  plot(Global_reactive_power~Datetime, ylab="Global Reactive Power", xlab="date/time", type="l")
})

dev.off