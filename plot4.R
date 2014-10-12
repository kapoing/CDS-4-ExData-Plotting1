
plot4 <- function() {
  ## This ensures that the xx axis has Thu, Fri and Sats
  Sys.setlocale("LC_TIME", "English")
  
  data<-read.csv2("household_power_consumption.txt",dec=".", header=TRUE, sep=";",na.strings="?" )
  date_time<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %T")
  data<-cbind(data,date_time)
  data_trimmed<-data[data$Date=="2/2/2007"|data$Date=="1/2/2007",]
  png("plot4.png")
  par(mfrow=c(2,2))
  plot(data_trimmed$date_time, data_trimmed$Global_active_power,
       ylab='Global Active Power', xlab='', type='l')
  plot(data_trimmed$date_time, data_trimmed$Voltage,
       xlab='datetime', ylab='Voltage', type='l')
  plot(data_trimmed$date_time, data_trimmed$Sub_metering_1, type='l',
       xlab='', ylab='Energy sub metering')
  lines(data_trimmed$date_time, data_trimmed$Sub_metering_2, col='red')
  lines(data_trimmed$date_time, data_trimmed$Sub_metering_3, col='blue')
  legend('topright', 
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         col=c('black', 'red', 'blue'), 
         lty='solid', bty='n')
  plot(data_trimmed$date_time, data_trimmed$Global_reactive_power,
       xlab='datetime', ylab='Global_reactive_power', type='l')
  dev.off()
  
}
