plot1 <- function(){
      k <- read.table("household_power_consumption.txt", header = T, sep = ";",na.strings = "?",colClasses = c("character","character",rep("numeric",7)))
      k$Date <- as.Date(k$Date, format = "%d/%m/%Y")
      l <- subset(k, k$Date == "2007-02-01" | k$Date == "2007-02-02")
      png(file = "plot1.png",width = 480, height = 480)
      hist(l[[3]], main = "Global Active Power", col = "red",xlab = "Global Active Power (kilowatts)")
      dev.off()
      
}