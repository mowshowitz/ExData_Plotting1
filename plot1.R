#download and unzip dataset
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "power.zip")
unzip("power.zip")

#create formatted date and time classes
setClass('myDate')
setClass('myTime')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
setAs("character","myTime", function(from) strptime(from, format="%H:%M:%S") )


#read data into r
power <- read.table(
      "household_power_consumption.txt", 
      header = TRUE, 
      sep = ";", 
      stringsAsFactors = FALSE, 
      colClasses = c("myDate", "myTime", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
      na.strings = "?"
      )

#subset data
subpower <- subset(power, Date >= '2007-02-01' & Date <= '2007-02-02')

#create plot 1
png(file = "plot1.png")
with(
      subpower, hist(
            Global_active_power, 
            main = "Global Active Power", 
            xlab = "Global Active Power (kilowatts)", 
            col = "red"
      )
)
dev.off()