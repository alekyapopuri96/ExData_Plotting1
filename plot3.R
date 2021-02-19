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

head(subset)
## open the graphic device and add plot and then lines of other two sub_metring
with(subset,{
  plot( Sub_metering_1~time ,col="black", type="l",xlab="",ylab="Energy sub metering")
  lines(Sub_metering_2~time,col="red")
  lines(Sub_metering_3~time,col="blue")
    
  })
## add legend to the right top corner
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##save to plot3.png
png("plot3.png")
