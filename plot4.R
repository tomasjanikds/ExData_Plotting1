## Plot 4
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

# change the grid for 4 plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# plot all of the plots
with(data1, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global_reactive_power",xlab="datetime")
})

# return back the par setting
par(mfrow = c(1,1), mar = (c(5, 4, 4, 2) + 0.1), oma = c(0, 0, 0, 0))

## write out the plots as png file into the working directory
png("plot4.png", width=480, height=480)

# change the grid for 4 plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(data1, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global_reactive_power",xlab="datetime")
})

dev.off()

# return back the par setting
par(mfrow = c(1,1), mar = (c(5, 4, 4, 2) + 0.1), oma = c(0, 0, 0, 0))
