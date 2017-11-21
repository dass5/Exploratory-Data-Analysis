#Read the data
household_data=read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = F)
#Convert the character Date field to Date
household_data$Date=as.Date(household_data$Date,"%d/%m/%Y")
#Subset data from the dates 2007-02-01 and 2007-02-02
data=household_data[(household_data$Date>="2007-02-01" & household_data$Date<="2007-02-02") , ]
#Make a column Datetime  from Date and Time column
data$Datetime=paste(data$Date,data$Time)
#Convert the new variable as POSIXlt
data$Datetime=strptime(data$Datetime,"%Y-%m-%d %H:%M:%S", tz = "EST5EDT")
#Create the plot and save it in plot2.png
png(file="plot2.png",width=480,height=480)
plot(data$Datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()

