getwd()

setwd("C:\\Users\\vikramjeet\\Desktop\\MMA- Queens\\Data Science  Specialization\\Datafiles\\Exploratory data analysis")

mydata <- read.table("./household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, header = TRUE)

str(mydata)

mydata1 <- subset(mydata, Date=="1/2/2007"|Date =="2/2/2007")

mydata1$Global_reactive_power <- as.numeric(mydata1$Global_reactive_power)
mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power)
mydata1$Voltage <- as.numeric(mydata1$Voltage)
mydata1$Sub_metering_1 <- as.numeric(mydata1$Sub_metering_1)
mydata1$Sub_metering_2 <- as.numeric(mydata1$Sub_metering_2)
mydata1$Sub_metering_3 <- as.numeric(mydata1$Sub_metering_3)

mydata1$Date <- strptime(paste(mydata1$Date, mydata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(mydata1$Date, mydata1$Global_active_power, type= "l", xlab = "", ylab="Global Active Power", cex =0.2) 

plot(mydata1$Date, mydata1$Voltage, type= "l", xlab = "datetime", ylab="Voltage")

plot(mydata1$Date, mydata1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering") 
lines(mydata1$Date,mydata1$Sub_metering_2, type = "l", col="red")
lines(mydata1$Date,mydata1$Sub_metering_3, type= "l", col= "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.0, col=c("black", "red", "blue"))

plot(mydata1$Date, mydata1$Global_reactive_power, type= "l", xlab = "datetime", ylab="Global_reactive_power") 

dev.off()
