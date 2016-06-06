household_power_consumption <- read.csv("~/Coursera/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")

household_power_consumption$Time<-paste(household_power_consumption$Date,household_power_consumption$Time,sep=" ")

household_power_consumption$Time<-strptime(household_power_consumption$Time,"%Y-%m-%d %H:%M:%S")

ds<-household_power_consumption[household_power_consumption$Date >= as.Date("2007-02-01") & household_power_consumption$Date <= as.Date("2007-02-02"),]

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(ds$Time,ds$Global_active_power,type="l",main="Global Active Power",xlab="",ylab="Global Active Power(kilowatts)")
plot(ds$Time,ds$Voltage,type="l",main="Voltage",xlab="",ylab="Voltage")
plot(ds$Time,ds$Sub_metering_1,type="l",main="Sub Metering",xlab="",ylab="Energy Sub Metering")
lines(ds$Time,ds$Sub_metering_2,type="l",col="red")
lines(ds$Time,ds$Sub_metering_3,type="l",col="blue")
plot(ds$Time,ds$Global_reactive_power,type="l",main="Reactive Power",xlab="",ylab="Global Reactive Power")
dev.off