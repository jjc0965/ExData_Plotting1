data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

data2days<-subset(data, (Date=="1/2/2007")|(Date=="2/2/2007"))
data2days$Date<-as.Date(data2days$Date, format="%d/%m/%Y")
data2days$Global_active_power<-as.numeric(as.character(data2days$Global_active_power))
data2days$Day<-weekdays(as.Date(data2days$Date))
datetime<-paste(data2days$Date, data2days$Time)

with(data2days, {
  plot(Day, xlab="", ylab="Energy sub metering", ylim=c(0,40))
  points(Sub_metering_1, col="blue", type="l")
  points(Sub_metering_2, col="red", type="l")
  points(Sub_metering_3, col="green", type="l")
})
legend("topright", pch="_", col=c("blue", "red", "green"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off