data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

data2days<-subset(data, (Date=="1/2/2007")|(Date=="2/2/2007"))
data2days$Date<-as.Date(data2days$Date, format="%d/%m/%Y")
data2days$Global_active_power<-as.numeric(as.character(data2days$Global_active_power))
data2days$Datetime<-as.POSIXct(paste(data2days$Date, data2days$Time))

png(filename = "plot2.png", width=480, height=480)
with (data2days, plot(Global_active_power~Datetime, ylab="Global Active Power (kilowatts)", xlab="", type="l"))

dev.off