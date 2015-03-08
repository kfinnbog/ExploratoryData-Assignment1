#Load Data into R
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

#Subset for 1/2/2007 or 2/2/2007 Dates Only

hpcsub<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

#Create Date and Time Variable from factor variables initally provided

hpcsub$DateTime<-strptime(paste(hpc_s$Date,hpc_s$Time),"%d/%m/%Y %H:%M:%S")

#Initialize PNG File
png(filename = "plot2.png")

#Create Plot
plot(hpcsub$DateTime,hpcsub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#Copy to PNG File
dev.off()