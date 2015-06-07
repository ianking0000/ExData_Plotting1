###Plot2####

##load data##
library(sqldf)
library(datasets)
data <- read.csv.sql("household_power_consumption.txt", header = TRUE,stringsAsFactors=FALSE,sep=";",sql="select * from file where Date in ('1/2/2007', '2/2/2007')")

##add now column to data, which is the real time###
data2 <- within(data, newT <- paste(Date, Time, sep=' '));
data2$newT = as.POSIXct(data2$newT,format = "%d/%m/%Y %H:%M:%OS",tz="UTC");

##drawing##
with(data2,plot(newT,Global_active_power,  type="l", ylab="Global Active Power (kilowavtts)", xlab=""))

###save to png ###
dev.copy(png,file="plot2.png",width=480,height=480,units="px")
dev.off()