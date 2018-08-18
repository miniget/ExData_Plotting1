# PLOT 4 Datetime v global reactive power graph 

## Get the existing working directory
getwd()

## Change the directory to my working directory where the data is stored
setwd("C:\\Users\\asten\\Documents\\Mini\\Data_science_training\\Exploratory_Data_Analysis\\Week1\\Prj_Data")


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


## To plot searate graphs in two column

par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 0, 0))


##To plot graph of time vs global active power data
plot(SubPrjData$Time,SubPrjData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",cex.lab=0.75,cex.axis=0.75) 

##Plot 2nd time v Voltage graph in column 2
plot(SubPrjData$Time,as.numeric(as.character(SubPrjData$Voltage)), type="l",xlab="datetime",ylab="Voltage",cex.lab=0.75, cex.axis=0.75)

## Plot Sub metering graphs with corresponding legends in column 2
plot(SubPrjData$Time,SubPrjData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",cex.lab=0.75,cex.axis=0.75)
with(SubPrjData,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(SubPrjData,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(SubPrjData,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill = 1:6, ncol = 1,
       cex = 0.70)

##Plots datetime v global reactive power graph in column 2

plot(SubPrjData$Time,as.numeric(as.character(SubPrjData$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power", cex.lab=0.75, cex.axis=0.75)