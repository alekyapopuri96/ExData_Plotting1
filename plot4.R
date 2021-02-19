##read the data
data<- data.table::fread("household_power_consumption.txt")
head(data)
## remove the NA's ## data preparation
data<-na.omit(data)

## subset the values betwees 01/02/2007 to 02/02/2007
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
## converting date in to date format
subset$Date <- as.Date(subset$Date, format="%d/%m/%Y")
head(subset$Date)
## collecting the date and time and a\passing throught POSIXct
time<- paste(as.Date(subset$Date), subset$Time)
subset$time <- as.POSIXct(time)
time
## converted the Global_active_power to numeric from character
Global_active_power <- as.numeric(subset$Global_active_power)
## created the graphic device and divided it to 2 rows and 2 cols
par(mfrow=c(2,2))
with(subset,{
  # 1st plot
  plot( time,Global_active_power, type="l", xlab="",ylab="Global Active Power")
  # 2ndst plot
  plot(time, Voltage, type="l", xlab="datetime", ylab="Voltage")
  #3rd plot
  plot( Sub_metering_1~time ,col="black", type="l",xlab="",ylab="Energy sub metering")
  lines(Sub_metering_2~time,col="red")
  lines(Sub_metering_3~time,col="blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
                                              legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #4th plot
  plot(time,Global_reactive_power,xlab="datetime", ylab="Global_reactive_power",type="l")
})
## saved the plot to plot4 png
png("plot4.png")


