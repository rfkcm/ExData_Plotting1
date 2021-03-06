library(dplyr)
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
dp <- tbl_df(data)
chida <- filter(dp,Date %in% c("1/2/2007","2/2/2007"))
ft <- strptime(paste(chida$Date, chida$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
g <- as.numeric(as.character(chida$Global_active_power))
png("plot2.png", width=480, height=480)
plot(ft,g, type="n",xlab=" ",ylab="Global Active Power (kilowatts)")
lines(ft,g)
dev.off()