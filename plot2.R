#Reads the data and subsets it to the dates from 01/02/2007 to 02/02/2007
householdData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

firstDay = as.Date("01/02/2007", "%d/%m/%Y")
lastDay = as.Date("02/02/2007", "%d/%m/%Y")

studyData <- householdData[as.Date(householdData$Date, "%d/%m/%Y") >= firstDay & as.Date(householdData$Date, "%d/%m/%Y") <= lastDay, ]

#Constructs the plot for the variable Global_active_power with labels "Thu", "Fri" and "Sat" adjusted to the total number of timesteps
png('plot2.png',width = 480,height = 480) 
plot(studyData$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n", type = "l")
axis(1, c(0, length(studyData[[1]])/2, length(studyData[[1]])), labels = c("Thu", "Fri", "Sat"))
dev.off()