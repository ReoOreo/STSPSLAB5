hhConsump<-read.table("f:/STSPSLAB5/household_power_consumption.txt", sep=";", 
                      header=TRUE, colClasses="character", na.strings="NA")

dtColumn <- paste(hhConsump$Date,hhConsump$Time)
dtColumn <- strptime(dtColumn, "%d/%m/%Y %H:%M:%S")
hhConsump$DateTime<-dtColumn

hhConsump$Date<-as.Date(hhConsump$Date,"%d/%m/%Y")
hhConsump<-hhConsump[hhConsump$Date>="2007-02-01" & hhConsump$Date<="2007-02-02",]

hhConsump$Global_active_power<-as.numeric(hhConsump$Global_active_power)

png(file="plot1.png")
hist(hhConsump$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
