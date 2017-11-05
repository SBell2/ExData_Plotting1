#call lubridate for managing dates
library(lubridate)

#read file into power df. Will vary depending on WD
power<-read.table("/Users/techteam/Documents/Data_Science/household_power_consumption.txt", header=TRUE, sep=";",
                  stringsAsFactors=FALSE)

#Convert dates to correct format
power$Date<-dmy(power$Date)
power$Time<-hms(power$Time)

#convert Global_Active_Power to numeric
power$Global_active_power<-as.numeric(power$Global_active_power)

#subset power df for dates used
power<-subset(power,power$Date=="2007-02-01"| power$Date=="2007-02-02")

hist(power$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.copy(png, file="plot1.png")
dev.off()
