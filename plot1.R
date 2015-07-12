plot1 = function(directory = ".") {
    # Read the first line (the column names of this power data)
    columnNames = read.table("../household_power_consumption.txt",
                             sep = ";",
                             nrows = 1)
    # Read the data from the dates 2007-02-01 and 2007-02-02
    powerData = read.table("../household_power_consumption.txt",
                      col.names = sapply(columnNames, as.character),
                      sep = ";",
                      nrows = 2880,
                      skip = 66637)
    
    # Set background to be transparent
    par(bg = "transparent")
    # Draw the plot
    hist(powerData$Global_active_power,
         col = "red",
         breaks = 12,
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power")
    
    # Copy the plot into a PNG file and close the PNG device
    dev.copy(png, file = "plot1.png")
    dev.off()
}
