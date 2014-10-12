
plot2 <- function() {
  ## This ensures that the xx axis has Thu, Fri and Sats
  Sys.setlocale("LC_TIME", "English")
  
  data<-read.csv2("household_power_consumption.txt",dec=".", header=TRUE, sep=";",na.strings="?" )
  date_time<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %T")
  data<-cbind(data,date_time)
  data_trimmed<-data[data$Date=="2/2/2007"|data$Date=="1/2/2007",]
  png("plot2.png")
  plot(data_trimmed$date_time, data_trimmed$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
  dev.off()
  
}
