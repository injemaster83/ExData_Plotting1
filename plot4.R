# Setting locale
Sys.setlocale("LC_TIME", "C")

# Before running the following code you need to install the following packages 

require(data.table)
require(ggplot2)
require(jpeg)

# Reading RAW .txt file with fread (MUST be in working directory) into a data.table object named "a"

a <- fread("./household_power_consumption.txt",header=T,na.strings='?')


# Subsetting the two dates (2007-02-01 and 2007-02-02)

a <- a[a$Date %in% c('1/2/2007','2/2/2007'),]


# Plot 4

png(file="plot4.png",width=480,height=480)

#Define plot grid of 2 x 2
par(mfrow = c(2,2))

#Top left plot
plot(strptime(paste(a$Date,a$Time),format="%d/%m/%Y %H:%M:%S"),a$Global_active_power,type='l',xlab ="",ylab="Global Active Power")
axis(1, at=as.Date(a$Date,format="%d/%m/%Y"), lab=format(as.Date(a$Date,format="%d/%m/%Y"),"%a"))

#Top right plot
plot(strptime(paste(a$Date,a$Time),format="%d/%m/%Y %H:%M:%S"),a$Voltage,type='l',xlab ="datetime",ylab="Voltage")
axis(1, at=as.Date(a$Date,format="%d/%m/%Y"), lab=format(as.Date(a$Date,format="%d/%m/%Y"),"%a"))

#Bottom left plot
plot(strptime(paste(a$Date,a$Time),format="%d/%m/%Y %H:%M:%S"),a$Sub_metering_1,type='l',col="black",xlab ="",ylab="Energy sub metering")
lines(strptime(paste(a$Date,a$Time),format="%d/%m/%Y %H:%M:%S"),a$Sub_metering_2,type='l',col="red",xlab ="",ylab="Energy sub metering")
lines(strptime(paste(a$Date,a$Time),format="%d/%m/%Y %H:%M:%S"),a$Sub_metering_3,type='l',col="blue",xlab ="",ylab="Energy sub metering")
axis(1, at=as.Date(a$Date,format="%d/%m/%Y"), lab=format(as.Date(a$Date,format="%d/%m/%Y"),"%a"))
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty = "n",col=c("black","red","blue"),cex=.9)

#Bottom right plot
plot(strptime(paste(a$Date,a$Time),format="%d/%m/%Y %H:%M:%S"),a$Global_reactive_power,type='l',xlab ="datetime",ylab="Global_reactive_power")
axis(1, at=as.Date(a$Date,format="%d/%m/%Y"), lab=format(as.Date(a$Date,format="%d/%m/%Y"),"%a"))

dev.off()
