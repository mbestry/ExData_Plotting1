# Import dataset

household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")

# Filter date range from 2007-02-01 to 2007-02-02

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
hpc_subset <- subset(household_power_consumption, household_power_consumption$Date >= as.Date("2007-02-01") & household_power_consumption$Date <= as.Date("2007-02-02"))

# Merge dates and times into one column

hpc_subset$Date <- paste(hpc_subset$Date, hpc_subset$Time, sep = " ")
library(lubridate)
hpc_subset$Date <- ymd_hms(hpc_subset$Date)

# Create graph

png(filename = './plot2.png', width = 480, height = 480)
plot(hpc_subset$Date, hpc_subset$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
