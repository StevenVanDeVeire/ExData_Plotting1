##Read data into dataframe
df <- read.table("household_power_consumption.txt",header = TRUE, na.strings = "?", sep=";")

##Convert Date column
df$Date <- as.Date(df$Date, "%d/%m/%Y")

##Filter out only the necessary data
df <- df[df$Date=="2007-2-1" | df$Date=="2007-2-2",]

##Combine the date and time column
df$Time <- as.POSIXct(paste(df$Date,df$Time),tz="", "%Y-%m-%d %H:%M:%S")

##Create a png named plot1.png
png("plot1.png", width = 480, height = 480)

##Create a histogram of the variable Global_active power
##Set the color of the graph, the label of the x-axis and the main title
hist(df$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

##Don't forget dev.off()
dev.off()