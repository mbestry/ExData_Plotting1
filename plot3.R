# Import dataset

household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")

# Filter date range from 2007-02-01 to 2007-02-02

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
hpc_subset <- subset(household_power_consumption, household_power_consumption$Date >= as.Date("2007-02-01") & household_power_consumption$Date <= as.Date("2007-02-02"))

# Merge dates and times into one column

hpc_subset$Date <- paste(hpc_subset$Date, hpc_subset$Time, sep = " ")
library(lubridate)
hpc_subset$Date <- ymd_hms(hpc_subset$Date)

# Create and export graph

png(filename = './plot3.png', width = 480, height = 480)
with(hpc_subset, plot(hpc_subset$Date, hpc_subset$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l'))
with(hpc_subset, lines(hpc_subset$Date, hpc_subset$Sub_metering_2, type = 'l', col = 'red'))
with(hpc_subset, lines(hpc_subset$Date, hpc_subset$Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', lty = 1, col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
