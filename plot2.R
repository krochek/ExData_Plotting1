plot2 <- function(){
      k <- read.table("household_power_consumption.txt", header = T, sep = ";",na.strings = "?",colClasses = c("character","character",rep("numeric",7)))
      k$Time <- paste(k$Date,k$Time, sep = " ")
      k$Time <- strptime(k$Time, format = "%d/%m/%Y %H:%M:%S")
      k$Date <- as.Date(k$Date, format = "%d/%m/%Y")
      l <- subset(k, k$Date == "2007-02-01" | k$Date == "2007-02-02")
      png(file = "plot2.png",width = 480, height = 480)
      plot(l[[2]],l[[3]], pch = NA, main = "", ylab = "Global Active Power (kilowatts)", xlab = "")
      lines(l[[2]], l[[3]])
      dev.off()
      plot2 <- l
      
}