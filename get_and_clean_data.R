#Exploratory data analysis week 1 course project

# add required packages
library(data.table) # to read data
library(lubridate) # to read/adjust date/time formats

# Create a source data file
if (!file.exists('source data1')) {
  dir.create('source data1')
}

# Make tidy data set (check to see if it exists first)
if (!file.exists('source data1/power_consumption.txt')) {
  
  # download and unzip file
  file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(file.url,destfile='source data1/power_consumption.zip')
  unzip('source data1/power_consumption.zip',exdir='source data1',overwrite=TRUE)
  
  # read the data and subset to 2 days
  variable.class<-c(rep('character',2),rep('numeric',7)) # make sure variables are the correct class
  power.consumption<-read.table('source data1/household_power_consumption.txt',header=TRUE,
                                sep=';',na.strings='?',colClasses=variable.class)
  power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
  
  # clean up the names and convert date/time fields
  cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
          'SubMetering1','SubMetering2','SubMetering3')
  colnames(power.consumption)<-cols
  power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
  power.consumption<-power.consumption[,c(10,3:9)]
  
  # write a clean data set to the directory
  write.table(power.consumption,file='source data1/power_consumption.txt',sep='|',row.names=FALSE)
} else {
  
  power.consumption<-read.table('source data1/power_consumption.txt',header=TRUE,sep='|')
  power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
  
}

# remove the large raw data set 
if (file.exists('source data1/household_power_consumption.txt')) {
  x<-file.remove('source data1/household_power_consumption.txt')
}
