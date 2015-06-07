## After checking the working directory, read the text file to memory
powerfile = read.csv("household_power_consumption.txt",sep=";", na.strings = "?")
## Convert Dates and Get the date subset
powerfile$Date = as.Date(powerfile$Date, format="%d/%m/%Y")
data = subset(powerfile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
##Convert Dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
##Plot ALL the things
par(mfrow=c(2,2))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", pt.cex=1,cex=.5, col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()