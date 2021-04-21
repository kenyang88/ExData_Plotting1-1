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

# return subset data
 subdata <- data[data$Date == "2007/02/01" | data$Date == "2007/02/02", ]

# create png file (plot1.png) with specified pixel size, x-axis label
# and histogram title
with(data, {
  png(filename = "plot1.png", units="px", width=480, height=480)
  hist(subdata$Global_active_power
       , main="Global Active Power"
       , col = "red"
       , xlab = "Global Active Power (kilowatts)")
  dev.off()
})