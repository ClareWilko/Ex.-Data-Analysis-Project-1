#set working directory

# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source('get_and_clean_data.R')

# open device
png(filename='plots/plot3.png',width=480,height=480,units='px')

# plot data - type one creates a line graph opposed to the default plotting of points
plot(power.consumption$DateTime,power.consumption$SubMetering1,ylab='Energy Sub Metering', xlab='', type='l')
points(power.consumption$DateTime,power.consumption$SubMetering2,  type='l', col="red")
points(power.consumption$DateTime,power.consumption$SubMetering3, type='l',col="blue")
legend('topright', legend=c('Sub Metering 1', 'Sub Metering 2', 'Sub Metering 3'), col= c('black', 'red', 'blue'), lty='solid')

# Turn off device
x<-dev.off()
