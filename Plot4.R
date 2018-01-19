##Read data into dataframe
df <- read.table("household_power_consumption.txt",header = TRUE, na.strings = "?", sep=";")

##Convert Date column
df$Date <- as.Date(df$Date, "%d/%m/%Y")

##Filter out only the necessary data
df <- df[df$Date=="2007-2-1" | df$Date=="2007-2-2",]

##Combine the date and time column
df$Time <- as.POSIXct(paste(df$Date,df$Time),tz="", "%Y-%m-%d %H:%M:%S")

##Create a png named plot4.png
png("plot4.png", width = 480, height = 480)

##Set the mfrow parameter to 2 column and 2 rows
par(mfrow = c(2,2))

##Create the plot
with(df,
   {
     ##Top left
     ##Create a plot of the variables Global_active power and Time
     ##Set the label of the Y-axis and clean the X-asis. Specify type="l" to draw a line instead of using points.
     plot(Time,Global_active_power, type="l", xlab="", ylab="Global Active Power")
     
     ##Top right
     ##Create a plot of the variables Voltager and Time
     ##Set the label of the X-axis. Specify type="l" to draw a line instead of using points.
     plot(Time,Voltage, type="l", xlab="datetime")
   
     ##Bottom right  
     ##Create a plot of the variables Sub_metering_1 and Time
     ##Set the label of the Y-axis and clean the X-asis. Specify type="l" to draw a line instead of using points.
     plot(Time,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
     ##Draw a red an a blue line in the plot for Sub_metering_2 and Sub_metering_3 respectively  
     lines(Time,Sub_metering_2, col="red")
     lines(Time,Sub_metering_3, col="blue")
     ##Set the legend in the top right corner with line type 1 and corresponding color and labels
     legend("topright", bty = "n", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))    
     
     ##Bottom left   
     ##Create a plot of the variables Global_reactive power and Time
     ##Set the label of the X-axis. Specify type="l" to draw a line instead of using points.
     plot(Time,Global_reactive_power, type="l", xlab="datetime")
   })

##Don't forget dev.off()
dev.off()