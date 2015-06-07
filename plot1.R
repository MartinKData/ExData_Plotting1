#Reads the data and subsets it to the dates from 01/02/2007 to 02/02/2007
householdData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

firstDay = as.Date("01/02/2007", "%d/%m/%Y")
lastDay = as.Date("02/02/2007", "%d/%m/%Y")

studyData <- householdData[as.Date(householdData$Date, "%d/%m/%Y") >= firstDay & as.Date(householdData$Date, "%d/%m/%Y") <= lastDay, ]

#Constructs the histogram for the variable Global_active_power in the color red
png('plot1.png',width = 480,height = 480) 
hist(studyData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()