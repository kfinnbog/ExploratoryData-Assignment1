#Load Data into R
hpc<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

#Subset for 1/2/2007 or 2/2/2007 Dates Only

hpcsub<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]

#Initialize PNG File
png(filename = "plot1.png")

#Create Histogram
hist(hpcsub$Global_active_power, col="red1", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Copy to PNG File
dev.off()