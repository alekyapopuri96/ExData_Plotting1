##read the data
data<- data.table::fread("household_power_consumption.txt")
head(data)
## remove the NA's ## data preparation
data<-na.omit(data)

## subset the values betwees 01/02/2007 to 02/02/2007
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subset$Date <- as.Date(subset$Date, format="%d/%m/%Y")
head(subset$Date)

time<- paste(as.Date(subset$Date), subset$Time)
subset$time <- as.POSIXct(time)
time

head(subset)

with(subset,{
  plot( Sub_metering_1~time ,col="black", type="l",xlab="",ylab="Energy sub metering")
  lines(Sub_metering_2~time,col="red")
  lines(Sub_metering_3~time,col="blue")
    
  })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
png("plot3.png")
