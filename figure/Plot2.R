
## Get the existing working directory
getwd()

## Change the directory to my working directory where the data is stored
setwd("C:\\Users\\asten\\Documents\\Mini\\Data_science_training\\Exploratory_Data_Analysis\\Week1\\Prj_Data")

#Plotting Global active power vs Date plot
## Load the main dataset
PrjData <- read.table("household_power_consumption.txt",skip=1,sep=";")

## Insert corresponding column names of the data
colnames(PrjData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(PrjData)

## Subset the project data
SubPrjData <- subset(PrjData,PrjData$Date=="1/2/2007" | PrjData$Date =="2/2/2007")

## Convert Global active power into numeric data type
SubPrjData$Global_active_power <- as.numeric(as.character(SubPrjData$Global_active_power))

##Convert the Date variable from characters into objects of type Date
SubPrjData$Date <- as.Date(SubPrjData$Date, format="%d/%m/%Y")

##Convert the Time variable from characters into objects of type Time
SubPrjData$Time <- strptime(SubPrjData$Time, format="%H:%M:%S")

##Change the date to the actual project date of the data
SubPrjData[1:1440,"Time"] <- format(SubPrjData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
SubPrjData[1441:2880,"Time"] <- format(SubPrjData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plotting the data
plot(SubPrjData$Time,SubPrjData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="Global Active Power Vs Time") 