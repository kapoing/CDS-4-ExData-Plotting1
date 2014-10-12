## Read and clean the data and then create an histogram for Global Active Power
## Data used refers to days 1/2/2007 and 2/2/2007

plot1 <- function() {
  ## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
  data<-read.csv2("household_power_consumption.txt",dec=".", header=TRUE, sep=";",na.strings="?" )
  date_time<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %T")
  data<-cbind(data,date_time)
  data_trimmed<-data[data$Date=="2/2/2007"|data$Date=="1/2/2007",]
  png("plot1.png")
  hist(data_trimmed$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="frequency")
  dev.off()
  
}