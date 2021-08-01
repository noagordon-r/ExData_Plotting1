## Plot 2

## Read file
if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/household_power_consumption.zip",method="curl")
consumptionData <- subset(read.table(unz("./data/household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";"),Date=="1/2/2007"|Date=="2/2/2007")

## Convert dates and missing data
consumptionData$DateTime<-paste(consumptionData$Date,":",consumptionData$Time)
consumptionData$DateTime<-strptime(consumptionData$DateTime,format="%d/%m/%Y : %H:%M:%S")
consumptionData$Global_active_power<-as.numeric(consumptionData$Global_active_power)
consumptionData$Global_reactive_power<-as.numeric(consumptionData$Global_reactive_power)
consumptionData$Voltage<-as.numeric(consumptionData$Voltage)
consumptionData$Global_intensity<-as.numeric(consumptionData$Global_intensity)
consumptionData$Sub_metering_1<-as.numeric(consumptionData$Sub_metering_1)
consumptionData$Sub_metering_2<-as.numeric(consumptionData$Sub_metering_2)

## Plot
## Set size
dev.new(width=480, height=480, unit="pixel")
## plot and attributes
with(consumptionData,plot(x=DateTime,y=Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
## Copy to png
dev.copy(png,"plot2.png")
dev.off()



