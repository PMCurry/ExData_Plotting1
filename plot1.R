## After checking the working directory, read the text file to memory
powerfile = read.csv("household_power_consumption.txt",sep=";", na.strings = "?")
## Convert Dates and Get the date subset
powerfile$Date = as.Date(powerfile$Date, format="%d/%m/%Y")
data = subset(powerfile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
##Plot histogram
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
##Save plot as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()