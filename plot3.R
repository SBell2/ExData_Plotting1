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

#convert submetering to numeric
power$Sub_metering_1<-as.numeric(power$Sub_metering_1)
power$Sub_metering_2<-as.numeric(power$Sub_metering_2)
power$Sub_metering_3<-as.numeric(power$Sub_metering_3)

#create an empty plot and then add lines
plot(x=power$datetime, y=power$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(power$datetime, power$Sub_metering_1, type="l", col="black")
points(power$datetime, power$Sub_metering_2, type="l", col="red")
points(power$datetime, power$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1), col=c("black", "red", "blue"), cex=0.75)

dev.copy(png, file="plot3.png")
dev.off()
