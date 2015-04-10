data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

data[,1]<-as.Date(data[,1], format="%d/%m/%Y")
data[,3]<-as.numeric(as.character(data[,3]))
data2days<-subset(data, (Date=="2007-02-01")|(Date=="2007-02-02"))

with (data2days, hist(data2days$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red"))

dev.copy(png, file = "plot1.png", width=480, height=480) ## Copy the histogram to a png file
dev.off()