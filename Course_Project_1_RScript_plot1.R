
UCepc<- read.table("~/Desktop/test_space/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

+ 

+ 

+projset<- subset(UCepc, Date == "1/2/2007" | Date == "2/2/2007") 

+GAP <- as.numeric(projset$Global_active_power) 

+png("plot1.png", height = 480, width = 480) 

+hist(GAP, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency") 

+dev.off()
