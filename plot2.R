## Plot 2
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

## time series
with(data1, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
})

## write out the plot as png file into the working directory
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
