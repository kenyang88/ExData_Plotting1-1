# read data
data <- read.table("./household_power_consumption.txt"
                   , header = TRUE, sep = ";"
                   , na.strings = "?"
                   , colClasses = c("character"
                                    , "character"
                                    , "numeric"
                                    , "numeric"
                                    , "numeric"
                                    , "numeric"
                                    , "numeric"
                                    , "numeric"
                                    , "numeric"))

# convert Date variable to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# return subset data from 2007/02/01 to 2007/02/02 only
subdata <- data[data$Date == "2007/02/01" | data$Date == "2007/02/02", ]

# create png file (plot3.png) with specified pixel size, y-axis label, and 
# specified line colors & legends
with(data, {
  png(filename = "plot3.png", units="px", width=480, height=480)
  x <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")
  plot(x, subdata$Sub_metering_1, type = "n"
       , ylab = "Energy sub metering", xlab = "")
  lines(x, subdata$Sub_metering_1, col = "black")
  lines(x, subdata$Sub_metering_2, col = "red")
  lines(x, subdata$Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue")
         , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
})