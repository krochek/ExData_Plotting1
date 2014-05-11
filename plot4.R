plot4 <- function(){
      k <- read.table("household_power_consumption.txt", header = T, sep = ";",na.strings = "?",colClasses = c("character","character",rep("numeric",7)))
      k$Time <- paste(k$Date,k$Time, sep = " ")
      k$Time <- strptime(k$Time, format = "%d/%m/%Y %H:%M:%S")
      k$Date <- as.Date(k$Date, format = "%d/%m/%Y")
      l <- subset(k, k$Date == "2007-02-01" | k$Date == "2007-02-02")
      png(file = "plot4.png",width = 480, height = 480)
      par(mfcol = c(2,2))
      plot(l[[2]],l[[3]], pch = NA, main = "", ylab = "Global Active Power (kilowatts)", xlab = "")
      lines(l[[2]], l[[3]])
      plot(l[[2]],l[[7]], type = "l", main = "", ylab = "Energy sub Metering", xlab = "")
      lines(l[[2]],l[[8]], col = "red")
      lines(l[[2]],l[[9]], col = "blue")
      legend("topright", pch = NA, bty= "n", col =  c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
      plot(l[[2]],l[[5]], main = "", xlab = "datetime", ylab = "Voltage", pch = NA)
      lines(l[[2]],l[[5]])
      plot(l[[2]],l[[4]], main ="",pch = NA, xlab = "datetime" , ylab = "Global_reactive_power")
      lines(l[[2]],l[[4]])
      dev.off()
      plot4 <- l
      
}