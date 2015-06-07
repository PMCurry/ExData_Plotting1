## After checking the working directory, read the text file to memory
powerfile = read.csv("household_power_consumption.txt",sep=";", na.strings = "?")
## Convert Dates and Get the date subset
powerfile$Date = as.Date(powerfile$Date, format="%d/%m/%Y")
data = subset(powerfile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
##Plot Metering Data
with(data, {plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")lines(Sub_metering_2~Datetime,col='Red')lines(Sub_metering_3~Datetime,col='Blue')})
##Add legend to upper right
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##Save Png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()