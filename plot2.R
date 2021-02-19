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
time <- as.POSIXct(time)
time
Global_active_power <- as.numeric(subset$Global_active_power)
plot(time, Global_active_power, type='l',ylab="Global Active Power(Kilowatts)",xlab="")
png("plot2.png")
