rm(list=ls())

data_all <- read.table("household_power_consumption.txt", header = T, sep=";", 
                       colClasses = c("character","character"))

data <- data_all[((data_all[,"Date"]=='1/2/2007') | data_all[,"Date"]=="2/2/2007") ,]

data_time <- as.POSIXct((strptime(paste(data[,"Date"],data[,"Time"],sep=" "),'%d/%m/%Y %T')))
data[,"Time"] <- data_time
data[,"Date"] <- as.Date(data[,"Date"],"%d/%m/%Y")

png("plot2.png")
with(data,plot( Time, as.numeric(Global_active_power),type="n",xlab="",ylab="Global Active Power(kilowatts)"))
lines(data[,"Time"],data[,"Global_active_power"])
dev.off()
