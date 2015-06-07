###Plot3####

##load data##
library(sqldf)
library(datasets)
data <- read.csv.sql("household_power_consumption.txt", header = TRUE,stringsAsFactors=FALSE,sep=";",sql="select * from file where Date in ('1/2/2007', '2/2/2007')")

##add now column to data, which is the real time###
data2 <- within(data, newT <- paste(Date, Time, sep=' '));
data2$newT = as.POSIXct(data2$newT,format = "%d/%m/%Y %H:%M:%OS",tz="UTC");

##drawing##
par(mfrow=c(2,2),mar=c(3,4,2,1),oma=c(0,0,2,0))
###fig.1###
with(data2,plot(newT,Global_active_power,  type="l", ylab="Global Active Power", xlab=""))
###fig.2####
with(data2,plot(newT,Voltage,  type="l", ylab="Voltage", xlab="datetime"))
###fig.3###
plot(data2$newT,data2$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="");
lines(data2$newT, data2$Sub_metering_2,col="red",ylab="",xlab="");
lines(data2$newT, data2$Sub_metering_3,col="blue",ylab="",xlab="")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,cex=0.75,bty="n")
###fig.4####
with(data2,plot(newT,Global_reactive_power,  type="l", ylab="Global_reactive_power", xlab="datetime"))

###save to png ###
dev.copy(png,file="plot4.png",width=480,height=480,units="px")
dev.off()