plot2 = function(directory = ".") {
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
    
    # Set locale to default for the C language and reflects North-American usage
    Sys.setlocale("LC_TIME", "C")
    # Convert Date and Time into "POSIXlt" and "POSIXct" classes
    powerData$Time = strptime(paste(as.character(powerData$Date),
                                    as.character(powerData$Time)),
                              "%d/%m/%Y %T")
    
    # Set background to be transparent
    par(bg = "transparent")
    
    # Draw the plot
    with(powerData, plot(Time,
                         Global_active_power,
                         type = "l",
                         xlab = "",
                         ylab = "Global Active Power (kilowatts)"))
    
    # Copy the plot into a PNG file and close the PNG device
    dev.copy(png, file = "plot2.png")
    dev.off()
}
