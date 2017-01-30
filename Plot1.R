getwd()

setwd("C:\\Users\\vikramjeet\\Desktop\\MMA- Queens\\Data Science  Specialization\\Datafiles\\Exploratory data analysis")

mydata <- read.table("./household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, header = TRUE)

str(mydata)

mydata1 <- subset(mydata, Date=="1/2/2007"|Date =="2/2/2007")

mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power)

png("plot1.png", width=480, height=480)

hist(mydata1$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power(kilowatts)") 

dev.off()
