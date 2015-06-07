## After checking the working directory, read the text file to memory
powerfile = read.csv("household_power_consumption.txt",sep=";", na.strings = "?")
## Convert Dates and Get the date subset
powerfile$Date = as.Date(powerfile$Date, format="%d/%m/%Y")
data = subset(powerfile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
##Convert Dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
##Plot
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
##Save to png file
dev.copy(png,file="plot2.png", height=480, width=480)
dev.off()