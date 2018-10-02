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

#Plot 4
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(time, voltage, type="l", xlab="date&time", ylab="Voltage")

plot(time, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(time, SubMetering2, type="l", col="red")
lines(time, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

plot(time, GlobalReactivePower, type="l", xlab="date&time", ylab="Global_reactive_power")
dev.off()