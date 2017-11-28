NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# plot1
a <- subset(NEI,select = c(Emissions,year))
boxplot(Emissions~year,data=NEI, main="PM2.5 Emission in each year", xlab="", ylab="PM2.5 Emission",ylim=c(0,1e+03))
pm25_sum <- aggregate(Emissions~year,data=a,sum)
barplot(pm25_sum$Emissions,names.arg=pm25_sum$year,ylab="PM2.5 Emission",main="Total PM2.5 Emission in Each Year")