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


#create Plot 1
png(filename = "Plot1.png", width = 480, height = 480, units = "px")

hist(df$Global_active_power,xlab= "Global Active Power (kilowatts)",col="red", main= "Global Active Power")

dev.off()






