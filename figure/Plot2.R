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

#Plot 2
png("plot2.png", width=480, height=480)
plot(time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)", 
     main = "Plot 2: Global Active Power vs Time")
dev.off()