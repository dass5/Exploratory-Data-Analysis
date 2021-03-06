#Read the data
household_data=read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = F)
#Convert the character Date field to Date
household_data$Date=as.Date(household_data$Date,"%d/%m/%Y")
#Subset data from the dates 2007-02-01 and 2007-02-02
data=household_data[(household_data$Date>="2007-02-01" & household_data$Date<="2007-02-02") , ]
#Make a column Datetime  from Date and Time column
data$Datetime=paste(data$Date,data$Time)
#Convert the new variable as POSIXlt object
data$Datetime=strptime(data$Datetime,"%Y-%m-%d %H:%M:%S", tz = "EST5EDT")
#Convert the variables as numeric
data$Voltage=as.numeric(data$Sub_metering_1)
data$Global_reactive_power=as.numeric(data$Sub_metering_2)
#Create the plots and place these in same figure
png(file="plot3.png",width=480,height=480)
plot(data$Datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(data$Datetime,data$Sub_metering_2,col="red")
lines(data$Datetime,data$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),  
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
dev.off()


