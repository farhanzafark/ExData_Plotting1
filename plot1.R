household_power_consumption <- read.csv("~/Coursera/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")

household_power_consumption$Time<-paste(household_power_consumption$Date,household_power_consumption$Time,sep=" ")

household_power_consumption$Time<-strptime(household_power_consumption$Time,"%Y-%m-%d %H:%M:%S")

ds<-household_power_consumption[household_power_consumption$Date >= as.Date("2007-02-01") & household_power_consumption$Date <= as.Date("2007-02-02"),]

png(file="plot1.png",width=480,height=480)
hist(ds$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off

