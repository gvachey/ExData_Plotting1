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
png(filename = "plot1.png",width = 480, height = 480)

# generate the plot1
hist(df$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col="red")
dev.off()
