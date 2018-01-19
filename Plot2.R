##Read data into dataframe
df <- read.table("household_power_consumption.txt",header = TRUE, na.strings = "?", sep=";")

##Convert Date column
df$Date <- as.Date(df$Date, "%d/%m/%Y")

##Filter out only the necessary data
df <- df[df$Date=="2007-2-1" | df$Date=="2007-2-2",]

##Combine the date and time column
df$Time <- as.POSIXct(paste(df$Date,df$Time),tz="", "%Y-%m-%d %H:%M:%S")

##Create a png named plot2.png
png("plot2.png", width = 480, height = 480)

##Create a plot of the variables Global_active power and Time
##Set the label of the Y-axis and clean the X-asis. Specify type="l" to draw a line instead of using points.
with(df,plot(Time,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

##Don't forget dev.off()
dev.off()