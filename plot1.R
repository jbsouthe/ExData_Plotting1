plot1 <- function( input = "../household_power_consumption.txt", output = "plot1.png" ){
  #read entire file
  pdata <- read.table(input, header = TRUE, sep = ";", na.strings = "?")
  #drop dates we don't need
  pdata <- subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")
  #convert the subset of dates into more usable format for plotting as TimeStamp
  pdata$TimeStamp <- strptime(paste(pdata$Date,pdata$Time), format = "%d/%m/%Y %H:%M:%S")
  
  #open png file for output
  png(output, width = 480, height = 480)
  
  #histogram in red with custom title and x axis label
  hist( bdata$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  
  #close and write png file
  dev.off()
}