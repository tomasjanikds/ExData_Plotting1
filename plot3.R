## Plot 3
# define path to the downloaded file
path <- "~/Documents/Coursera/datasciencecoursera/household_power_consumption.txt"

# read the data in
data_full <- read.csv(path, header=T, sep=';', na.strings="?", 
                      stringsAsFactors=F)

# subset only necessary rows
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

# date conversion
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

# datetime conversion
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## multiple time series
with(data1, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})

# add legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## write out the plot as png file into the working directory
png("plot3.png", width=480, height=480)
with(data1, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})

# add legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
