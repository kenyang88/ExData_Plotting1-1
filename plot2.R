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

# create png file (plot2.png) with specified pixel size, y-axis label
with(subdata, {
  png(filename = "plot2.png", units="px", width=480, height=480)
  y <- subdata$Global_active_power
  x <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")
  plot(x, y, type = "l"
       , ylab = "Global Active Power (kilowatts)"
       , xlab = "")
  dev.off()
})
