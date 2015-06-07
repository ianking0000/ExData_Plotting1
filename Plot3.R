###plot3####

##load data##
library(sqldf)
library(datasets)
data <- read.csv.sql("household_power_consumption.txt", header = TRUE,stringsAsFactors=FALSE,sep=";",sql="select * from file where Date in ('1/2/2007', '2/2/2007')")

##add now column to data, which is the real time###
data2 <- within(data, newT <- paste(Date, Time, sep=' '));
data2$newT = as.POSIXct(data2$newT,format = "%d/%m/%Y %H:%M:%OS",tz="UTC");

##drawing##
plot(data2$newT,data2$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="");
lines(data2$newT, data2$Sub_metering_2,col="red",ylab="",xlab="");
lines(data2$newT, data2$Sub_metering_3,col="blue",ylab="",xlab="")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,cex=0.75,pt.cex = 1)

###save to png ###
dev.copy(png,file="plot3.png",width=480,height=480,units="px")
dev.off()