library(dplyr)
library(lubridate)

# Load data located in working directory
df <- read.table(file.path("household_power_consumption.txt"),sep=";" ,dec=".",header=TRUE,na.strings = c("","?"))

#Change Date and Time to Date class
df$Date <- dmy(df$Date)
df$Time <- hms(df$Time)

# Filtering the only two days of interest
df <- df %>% filter( Date >= date("2007-02-01") & Date <= date("2007-02-02") )
chg_day <- which(df$Date == date("2007-02-02") & df$Time== 0)

# Opening PNG device
png(filename = "plot3.png",width = 480, height = 480)

# generate the plot3
plot(df$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab="",xaxt = "n")
lines(df$Sub_metering_2,type = "l",col="red")
lines(df$Sub_metering_3,type = "l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
axis(side=1, at=c(1,chg_day,2880), labels=c("Thu","Fri","Sat"))
dev.off()
