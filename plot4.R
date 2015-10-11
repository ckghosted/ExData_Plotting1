# Read the first line (the column names of this power data)
columnNames = read.table("household_power_consumption.txt",
                         sep = ";",
                         nrows = 1)

# Read the data from the dates 2007-02-01 and 2007-02-02
powerData = read.table("household_power_consumption.txt",
                       col.names = sapply(columnNames, as.character),
                       sep = ";",
                       nrows = 2880,
                       skip = 66637)

# Set locale to default for the C language and reflects North-American usage
Sys.setlocale("LC_TIME", "C")
# Convert Date and Time into "POSIXlt" and "POSIXct" classes
powerData$Time = strptime(paste(as.character(powerData$Date),
                                as.character(powerData$Time)),
                          "%d/%m/%Y %T")

# Set 2-by-2 sub-plots
par(mfrow = c(2, 2))
# sub-plot 1 (upper-left)
with(powerData, plot(Time,
                     Global_active_power,
                     type = "l",
                     xlab = "",
                     ylab = "Global Active Power"))
# sub-plot 2 (upper-right)
with(powerData, plot(Time,
                     Voltage,
                     type = "l",
                     xlab = "datetime",
                     ylab = "Voltage"))
# sub-plot 3 (lower-left)
with(powerData, plot(Time,
                     Sub_metering_1,
                     xlab = "",
                     ylab = "Energy sub metering",
                     type = "n"))
with(powerData, lines(Time,
                      Sub_metering_1,
                      col = "black"))
with(powerData, lines(Time,
                      Sub_metering_2,
                      col = "red"))
with(powerData, lines(Time,
                      Sub_metering_3,
                      col = "blue"))
legend("topright",
       col = c("black", "blue", "red"),
       lty = c(1, 1, 1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# sub-plot 4 (lower-right)
with(powerData, plot(Time,
                     Global_reactive_power,
                     type = "l",
                     xlab = "datetime",
                     ylab = "Global_reactive_power"))

# Copy the plot into a PNG file and close the PNG device
dev.copy(png, file = "plot4.png")
dev.off()