#Read the data
household_data=read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = F)
# Set the scipen
options(scipen=999)
#Convert the character Date field to Date
household_data$Date=as.Date(household_data$Date,"%d/%m/%Y")
#Subset data from the dates 2007-02-01 and 2007-02-02
data=household_data[(household_data$Date>="2007-02-01" & household_data$Date<="2007-02-02") , ]
#Convert Global_active_power to numeric
data$Global_active_power=as.numeric(data$Global_active_power)
#Create the histogram and save it in plot1.png
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col = "red")
dev.off()





