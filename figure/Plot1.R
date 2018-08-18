## Get the existing working directory
getwd()
## Change the directory to my working directory where the data is stored
setwd("C:\\Users\\asten\\Documents\\Mini\\Data_science_training\\Exploratory_Data_Analysis\\Week1\\Prj_Data")

#PLOT 1
## Load the main dataset
PrjData <- read.table("household_power_consumption.txt",skip=1,sep=";")

## Insert corresponding column names of the data
colnames(PrjData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(PrjData)

## Subset the project data
SubPrjData <- subset(PrjData,PrjData$Date=="1/2/2007" | PrjData$Date =="2/2/2007")

## Convert Global active power into numeric data type
SubPrjData$Global_active_power <- as.numeric(as.character(SubPrjData$Global_active_power))

##Ploting Global Active Power Histogram 
hist(SubPrjData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")