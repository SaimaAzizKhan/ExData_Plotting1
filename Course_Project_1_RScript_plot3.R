library(lubridate)

setwd("~/Documents/Personal/Coursera/Exploratory Data Analysis")
household_power_consumption <- read.table("household_power_consumption.txt",skip=1, sep = ";")
names(household_power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
household_power_consumption$Time <- strptime(household_power_consumption$Time, format="%H:%M:%S")

household_power_consumption$newDateTime <- make_datetime(
year(household_power_consumption$Date), 
month(household_power_consumption$Date), 
day(household_power_consumption$Date), 
hour(household_power_consumption$Time), 
minute(household_power_consumption$Time), 
second(household_power_consumption$Time))

twodays <- subset(household_power_consumption,household_power_consumption$Date=="2007-02-01" | household_power_consumption$Date =="2007-02-02")

lgnd <- c("Energy sub metering_1","Energy sub metering_2","Energy sub metering_3")
with(twodays, plot(newDateTime,  as.numeric(as.character(Sub_metering_1)), type="n", xlab = "", ylab = "Energy sub metering"))
with(twodays, points(newDateTime,as.numeric(as.character(Sub_metering_1)), col="black", type="l"))
with(twodays, points(newDateTime,as.numeric(as.character(Sub_metering_2)), col="red"  , type="l"))
with(twodays, points(newDateTime,as.numeric(as.character(Sub_metering_3)), col="blue" , type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c(lgnd))

dev.copy(png,file="plot3.png", width = 480, height = 480)
dev.off()
