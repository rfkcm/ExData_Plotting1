library(dplyr)
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
dp <- tbl_df(data)
chida <- filter(dp,Date %in% c("1/2/2007","2/2/2007"))
ft <- strptime(paste(chida$Date, chida$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
v <- as.numeric(as.character(chida$Voltage))
g <- as.numeric(as.character(chida$Global_active_power))
q <- as.numeric(as.character(chida$Sub_metering_1))
qq <- as.numeric(as.character(chida$Sub_metering_2))
qqq <- as.numeric(as.character(chida$Sub_metering_3))

png("plot4.png", width=480, height=480)

par(mfcol=c(2,2))

plot(ft,g, type="n",xlab=" ",ylab="Global Active Power (kilowatts)")
lines(ft,g)

plot(ft,q, type="n",xlab=" ",ylab="Energy sub metering")
lines(ft,q)
lines(ft,qq,col = "red")
lines(ft,qqq,col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=1)

plot(ft,v, type="n",ylab="Voltage",xlab="datetime")
lines(ft,v)
plot(ft,as.numeric(as.character(chida$Global_reactive_power)), type = "n",ylab="Global_active_power",xlab="datetime")
lines(ft,as.numeric(as.character(chida$Global_reactive_power)))
dev.off()



