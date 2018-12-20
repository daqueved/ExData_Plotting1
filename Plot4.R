library(dplyr)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "UCI.zip")
unzip("UCI.zip")
df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

df <- tbl_df(df)
df$Date <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

df <- filter(df, Date >= "2007-02-01" & Date < "2007-02-03")
par(mfcol= c(2,2))

#Plot1
plot(df$Date, df$Global_active_power, type ="l",
	ylab = "Global active power (kilowatts)", 
	xlab = "")

#Plot2
plot(df$Date, df$Sub_metering_1 , type ="l",
	ylab = "Energy sub metering", 
	xlab = "")
lines(df$Date, df$Sub_metering_2, col= "red")
lines(df$Date, df$Sub_metering_3, col= "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
	 lwd= 1, col=c("black", "red", "blue"))


#Plot3
plot(df$Date, df$Voltage , type ="l",
	ylab = "Voltage", 
	xlab = "Datetime")

#Plot4
plot(df$Date, df$Global_reactive_power , type ="l",
	ylab = "Global_reactive_power", 
	xlab = "Datetime")


dev.copy(png, file = "Plot4.png", width = 480, height = 480, unit = "px")
dev.off()