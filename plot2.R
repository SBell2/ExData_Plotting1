#call lubridate for managing dates
library(lubridate)

#read file into power df. Will vary depending on WD
power<-read.table("/Users/techteam/Documents/Data_Science/household_power_consumption.txt", header=TRUE, sep=";",
                  stringsAsFactors=FALSE)
power$Date<-dmy(power$Date)

#subset power df for dates used
power<-subset(power,power$Date=="2007-02-01"| power$Date=="2007-02-02")

#create datetime variable
power$datetime<-paste(power$Date, " ", power$Time)
power$datetime<-ymd_hms(power$datetime)

#convert Global_Active_Power to numeric
power$Global_active_power<-as.numeric(power$Global_active_power)

plot(power$datetime, power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.copy(png, file="plot2.png")
dev.off()
