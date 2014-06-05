plot4 <- function( input = "../household_power_consumption.txt", output = "plot4.png" ){
  #read entire file
  pdata <- read.table(input, header = TRUE, sep = ";", na.strings = "?")
  #drop dates we don't need
  pdata <- subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")
  #convert the subset of dates into more usable format for plotting as TimeStamp
  pdata$TimeStamp <- strptime(paste(pdata$Date,pdata$Time), format = "%d/%m/%Y %H:%M:%S")
  
  #open png file for output
  png(output, width = 480, height = 480)
  
  #setup grid 2x2 to be loaded by rows
  par(mfrow= c(2,2))
  
  #insert plot at 1,1
  plot( pdata$TimeStamp, pdata$Global_active_power, type="l", xlab="", ylab="Global Active Power" )
  
  #insert plot at 1,2
  plot( pdata$TimeStamp, pdata$Voltage, type="l", xlab="datetime", ylab="Voltage" )
  
  #insert plot at 2,1
  #line graph with three sub metering metrics and a legend
  with( pdata, {
    plot( TimeStamp, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering" )
    lines( TimeStamp, Sub_metering_2, type="l", xlab="", ylab="Energy sub metering", col="red")
    lines( TimeStamp, Sub_metering_3, type="l", xlab="", ylab="Energy sub metering", col="blue")
    legend( "topright", 
            legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
            col = c("black","red","blue"),
            lty = 1,
            bty = "n"
      )
    } )
  
  #insert plot at 2,2
  plot( pdata$TimeStamp, pdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power" )
  
  #close and write png file
  dev.off()
}