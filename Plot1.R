library(dplyr)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "UCI.zip")
unzip("UCI.zip")
df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

df <- tbl_df(df)
df$Date <- strptime(df$Date, format = "%d/%m/%Y")
df$Date <- as.Date(df$Date)

df <- filter(df, Date >= "2007-02-01" & Date <= "2007-02-02")

hist(df$Global_active_power, col = "red", main = "Global active power",
        xlab = "Global active power (kilowatts)")

dev.copy(png, file = "Plot1.png", width = 480, height = 480, unit = "px")
dev.off()