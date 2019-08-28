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

#THE FIRST FIGURE
png(file="plot1.png", bg="transparent",height = 480,width = 480)
hist(data_s$Global_active_power,col='red',xlab ='Global Active Power (kilowatts)',ylab = 'Frequency',main = 'Global Active Power')
dev.off()

