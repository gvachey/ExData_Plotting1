library(dplyr)
library(lubridate)

# Load data located in working directory
df <- read.table(file.path("household_power_consumption.txt"),sep=";" ,dec=".",header=TRUE,na.strings = c("","?"))

#Change Date and Time to Date class
df$Date <- dmy(df$Date)
df$Time <- hms(df$Time)

# Filtering the only two days of interest
df <- df %>% filter( Date >= date("2007-02-01") & Date <= date("2007-02-02") )

# Opening PNG device
png(filename = "plot2.png",width = 480, height = 480)
chg_day <- which(df$Date == date("2007-02-02") & df$Time== 0)
# generate the plot2
plot(df$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab="",xaxt = "n")
axis(side=1, at=c(1,chg_day,2880), labels=c("Thu","Fri","Sat"))
dev.off()
