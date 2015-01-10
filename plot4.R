#set working directory

# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source('get_and_clean_data.R')

# open device
png(filename='plots/plot4.png',width=480,height=480,units='px')

# Change the graph area to plot all 4 graphs
par(mfrow=c(2,2))

#plot graph 1
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

#plot graph 2
plot(power.consumption$DateTime,power.consumption$Voltage,ylab='Voltage', xlab='Date Time', type='l')

#Plot graph 3
plot(power.consumption$DateTime,power.consumption$SubMetering1,ylab='Energy Sub Metering', xlab='', type='l')
points(power.consumption$DateTime,power.consumption$SubMetering2,  type='l', col="red")
points(power.consumption$DateTime,power.consumption$SubMetering3, type='l',col="blue")
legend('topright', legend=c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3'), cex=0.7, col= c('black', 'red', 'blue'), lty='solid')

#Plot graph 4
plot(power.consumption$DateTime,power.consumption$GlobalReactivePower,ylab='Global Reactive Power ', xlab='Date Time', type='l')

# Turn off device
x<-dev.off()


