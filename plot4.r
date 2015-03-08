#Load Data into R
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

#Subset for 1/2/2007 or 2/2/2007 Dates Only

hpcsub<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

#Create Date and Time Variable from factor variables initally provided

hpcsub$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")

#Initialize PNG File
png(filename = "plot4.png")

#Establish Parameters to Support Multiple Plots
par(mfcol=c(2,2))

#Create Top Left Plot
plot(hpcsub$DateTime,hpcsub$Global_active_power, type="l", ylab="Global Active Power", xlab="")

#Create Bottom Left Plot
with(hpcsub, plot(hpcsub$DateTime,hpcsub$Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
points(hpcsub$DateTime,hpcsub$Sub_metering_1,type="l")
points(hpcsub$DateTime,hpcsub$Sub_metering_2,type="l", col="red1")
points(hpcsub$DateTime,hpcsub$Sub_metering_3,type="l", col="blue1")

legend("topright", pch="",col=c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Create Top Right Plot
with(hpcsub, plot(hpcsub$DateTime,hpcsub$Voltage, type="l", ylab="Voltage", xlab="datetime"))

#Create Bottom Right Plot
with(hpcsub, plot(hpcsub$DateTime,hpcsub$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))

#Copy to PNG File
dev.off()