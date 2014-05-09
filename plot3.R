##################################################################
#    Exploratory Data Analysis (Coursera - John Hopkins)     #####
#           Project assignment 1   - 10-May-2014             #####
#                         Plot 3                             #####
##################################################################


library(lubridate)


# Read the file household_power_consumption.txt
# Load the "?" values as "NA"; and the separtor as semicolon
# ***Important**** If testing the code, please ensure to input where the source file is located in the filepath variable

filepath <- "~/R/household_power_consumption.txt"
hh_power <- read.table(filepath, sep=";", na.strings="?", header=TRUE)

# convert the Date variable to Date class in R

hh_power$Date <- as.Date(hh_power$Date, "%d/%m/%Y")

# Subset the particular dates to a new table.
Feb07_power <- subset(hh_power, Date >= as.Date('02-01-2007', '%m-%d-%Y') & Date <= as.Date('02-02-2007', '%m-%d-%Y'))

# Create a DateTime variable
Feb07_power$DateTime <- ymd_hms(paste(Feb07_power$Date, Feb07_power$Time))

# Generate Plot 3 in a histogram and send to png file
# Assign appropriate labels and append different colored lines per variable
# Finally add the legend.

png(file = "plot3.png", width = 480, height = 480)
with(Feb07_power, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", col="red"))
with(Feb07_power, lines(DateTime, Sub_metering_1, type="l", col="black"))
with(Feb07_power, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(Feb07_power, lines(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright",cex=1, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
