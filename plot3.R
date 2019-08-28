#To prevent that the month or the weekdays will be printed in Chinese
Sys.setlocale("LC_TIME", "English")
#TO READ THE DATA
data_raw = read.table("household_power_consumption.txt",header = TRUE,stringsAsFactors = TRUE,sep = ';')
#TO PREPROCESS THE DATA
data_raw$Date<-as.Date(data_raw$Date,"%d/%m/%Y")
data_raw$Time<-format(strptime(data_raw$Time,"%H:%M:%S"),"%H:%M:%S")
data_s <- subset(data_raw,Date>=as.Date('2007-2-1')&Date<=as.Date('2007-2-2'))
rm(data_raw)
data_s[,3:9]<-apply(data_s[,3:9],2,as.numeric)

#TO SET THE TIME
data_s$Time<-strptime((mapply(paste,data_s$Date,data_s$Time)),"%Y-%m-%d %H:%M:%S")

#THE THIRD FIGURE
png(file = 'plot3.png',bg = 'transparent',height = 480,width = 480)
plot(data_s$Time,data_s$Sub_metering_1,type = 'S',ylab = 'Energy sub metering',xlab = '')
lines(data_s$Time,data_s$Sub_metering_2,col = 'red',type = 'S')
lines(data_s$Time,data_s$Sub_metering_3,col = 'blue',type = 'S')
legend('topright',legend = c("Sub_metering_1",'Sub_metering_2','Sub_metering_3'),lty = 1,col = c("black",'red','blue'))
dev.off()