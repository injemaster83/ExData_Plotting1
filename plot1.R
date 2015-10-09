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


# Plot 1

png(file="plot1.png",width=480,height=480)
hist(as.numeric(a$Global_active_power),xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()


