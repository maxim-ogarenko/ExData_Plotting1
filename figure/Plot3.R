setwd("C:/Users/Admin/Documents/DS from Coursera/4 Exploratory Data Analysis/PrAssignment1")
zipurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipurl, destfile = "source_file.zip", method = "curl")
unzip("source_file.zip")

consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
consumption <- consumption[c(consumption$Date=="1/2/2007", consumption$Date=="2/2/2007"), ]

consumption$Date <- suppressWarnings(as.Date(consumption$Date,"%d/%m/%Y"))
time <- paste(consumption$Date, consumption$Time)
time <- strptime(time, format = "%Y-%m-%d %H:%M:%S")

GlobalActivePower <- as.numeric(consumption$Global_active_power)

SubMetering1 <- as.numeric(consumption$Sub_metering_1)
SubMetering2 <- as.numeric(consumption$Sub_metering_2)
SubMetering3 <- as.numeric(consumption$Sub_metering_3)

voltage <- as.numeric(consumption$Voltage)

GlobalReactivePower <- as.numeric(consumption$Global_reactive_power)

#Plot3
png("plot3.png", width=480, height=480)
plot(time, SubMetering1, type="l", ylab="Energy Submetering", xlab="", 
     main="Plot 3: Energy Submetering")
lines(time, SubMetering2, type="l", col="red")
lines(time, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"))
dev.off()