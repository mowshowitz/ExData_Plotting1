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

#create plot 2
png(file = "plot2.png")
with(subpower,
     plot(Global_active_power,
          type = "l",
          ylab = "Global active power (kilowatts)",
          xlab = "Day",
          xaxt = "n"
          )
     )
axis(1, at = c(1, 1450, 2850), labels = c("Thu", "Fri", "Sat"))
dev.off()