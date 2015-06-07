#Reads the data and subsets it to the dates from 01/02/2007 to 02/02/2007
householdData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

firstDay = as.Date("01/02/2007", "%d/%m/%Y")
lastDay = as.Date("02/02/2007", "%d/%m/%Y")

studyData <- householdData[as.Date(householdData$Date, "%d/%m/%Y") >= firstDay & as.Date(householdData$Date, "%d/%m/%Y") <= lastDay, ]

#Constructs the plot for the variables Sub_metering_1 to Sub_metering_3 and a corresponding legend
png('plot3.png',width = 480,height = 480) 
plot(studyData$Sub_metering_1, ylab = "Energy sub metering", xlab = "", xaxt = "n", type = "l")
lines(studyData$Sub_metering_2, col = "red", type = "l")
lines(studyData$Sub_metering_3, col = "blue", type = "l")
axis(1, c(0, length(studyData[[1]])/2, length(studyData[[1]])), labels = c("Thu", "Fri", "Sat"))
legend("topright", pch = -0x2500, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()