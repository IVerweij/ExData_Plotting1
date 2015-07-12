# set language to english

language <- "English" 
Sys.setlocale("LC_TIME", language) 

#get sqldf to read only 2007-02-01 and 2007-02-02 dates
install.packages("sqldf")
library(sqldf)

# then only read dates 2007-02-01 and 2007-02-02
File=file("household_power_consumption.txt")
df=read.csv.sql("household_power_consumption.txt","select * from File where Date in ('1/2/2007', '2/2/2007')", header=TRUE, sep= ";")

#Date & Time in correct format
df$DateTime=strptime(paste(df$Date, df$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

# create plot 3
png(filename = "Plot3.png", width = 480, height = 480, units = "px")

plot(df$DateTime,df$Sub_metering_3,type="l",col="blue", xlab="",ylab="Energy sub metering",ylim=c(0,40))
par(new=T)
plot(df$DateTime,df$Sub_metering_2,type="l",col="red",ylim=c(0,40), xlab="",ylab="Energy sub metering")
par(new=T)
plot(df$DateTime,df$Sub_metering_1,type="l",col="black",ylim=c(0,40) ,xlab="",ylab="Energy sub metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), lty=1,lwd=1)

dev.off()

