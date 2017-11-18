# read data from file
data_all <- read.table("household_power_consumption.txt", header = T, sep=";", 
                      colClasses = c("character","character"))

# only data from 2007-02-01 and 2007-02-02 are used.
data <- data_all[((data_all[,"Date"]=='1/2/2007') | data_all[,"Date"]=="2/2/2007") ,]

# convert data type value 
data[,"Date"] <- as.Date(data[,"Date"],"%d/%m/%Y")
data[,"Time"]<- (strptime(data[,"Time"],'%H:%M:%s'))

# plot figures to png file
png("plot1.png")
with(data,hist(as.numeric(Global_active_power),col = "Red",main = "Global Active Power",
               xlab = "Global Active Power (kilowatts)",ylim = c(0,1200)))
dev.off()

# end
