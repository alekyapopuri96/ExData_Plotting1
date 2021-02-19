##read the data
data<- data.table::fread("household_power_consumption.txt")
head(data)
## remove the NA's ## data preparation
data<-na.omit(data)

## subset the values betwees 01/02/2007 to 02/02/2007
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
str(subset)
head(subset$Global_active_power)

## convert the char to numeric for plotting
Global_active_power <- as.numeric(subset$Global_active_power)

## plot the gobal active power

hist(Global_active_power, col= "red", xlab="Global Active Power(Kilowatts)", ylab="Frequency", main ="Global Active Power")
# save the plot to png file.
png("plot1.png")
