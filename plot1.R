# Import dataset

household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")

# Filter date range from 2007-02-01 to 2007-02-02

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")
hpc_subset <- subset(household_power_consumption, household_power_consumption$Date >= as.Date("2007-02-01") & household_power_consumption$Date <= as.Date("2007-02-02"))

# Create graph

png(filename = './plot1.png', width = 480, height = 480)
hist(hpc_subset$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()