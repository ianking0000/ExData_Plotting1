###Plot1####

##load data##
library(sqldf)
library(datasets)
data <- read.csv.sql("household_power_consumption.txt", header = TRUE,stringsAsFactors=FALSE,sep=";",sql="select * from file where Date in ('1/2/2007', '2/2/2007')")

##Draw hist####
hist(data$Global_active_power,col="red",breaks=12,main="Global Active Power",xlab="Global active power (kilowatts)")

###save to png ###
dev.copy(png,file="plot1.png",width=480,height=480,units="px")
dev.off()
