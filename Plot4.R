# read data from file
data_all <- read.table("household_power_consumption.txt", header = T, sep=";", 
                       colClasses = c("character","character"))

# only data from 2007-02-01 and 2007-02-02 are used.
data <- data_all[((data_all[,"Date"]=='1/2/2007') | data_all[,"Date"]=="2/2/2007") ,]

# convert data type value 
data_time <- as.POSIXct((strptime(paste(data[,"Date"],data[,"Time"],sep=" "),'%d/%m/%Y %T')))
data[,"Time"] <- data_time
data[,"Date"] <- as.Date(data[,"Date"],"%d/%m/%Y")

# plot figures to png file
png("plot4.png")
par(mfrow=c(2,2))
#plot top left figure
with(data,plot( Time, as.numeric(Global_active_power),type="n",xlab="",ylab="Global Active Power(kilowatts)"))
lines(data[,"Time"],data[,"Global_active_power"])

#plot top right figure
with(data,plot( Time, as.numeric(Voltage),type="n",ylab="Voltage",xlab="datetime"))
lines(data[,"Time"],data[,"Voltage"])

#plot bottom left figure
with(data,plot( Time, as.numeric(Sub_metering_1),type="n",xlab="",ylab="Energy sub Metering"))
lines(data[,"Time"],data[,"Sub_metering_1"],col="black")
lines(data[,"Time"],data[,"Sub_metering_2"],col="red")
lines(data[,"Time"],data[,"Sub_metering_3"],col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),bty = "n")

#plot bottom right figure
with(data,plot( Time, as.numeric(Global_reactive_power),type="n",ylab="Global_reactive_power",xlab="datetime"))
lines(data[,"Time"],data[,"Global_reactive_power"])

dev.off()

# end
