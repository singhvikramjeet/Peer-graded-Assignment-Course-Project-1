getwd()

setwd("C:\\Users\\vikramjeet\\Desktop\\MMA- Queens\\Data Science  Specialization\\Datafiles\\Exploratory data analysis")

mydata <- read.table("./household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, header = TRUE)

str(mydata)

mydata1 <- subset(mydata, Date=="1/2/2007"|Date =="2/2/2007")

mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power)

mydata1$Date <- strptime(paste(mydata1$Date, mydata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)

plot(mydata1$Date, mydata1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatt)") 

dev.off()
