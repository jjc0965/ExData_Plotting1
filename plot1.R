data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

data2days<-subset(data, (Date=="1/2/2007")|(Date=="2/2/2007"))
data2days$Global_active_power<-as.numeric(as.character(data2days$Global_active_power))

png(filename = "plot1.png", width=480, height=480)
with(data2days, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red"))

dev.off()