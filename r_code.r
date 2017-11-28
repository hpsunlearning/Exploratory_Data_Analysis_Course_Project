# plot1
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
a <- subset(NEI,select = c(Emissions,year))

pm25_sum <- aggregate(Emissions~year,data=a,sum)
png(filename = "plot1.png")
barplot(pm25_sum$Emissions,names.arg=pm25_sum$year,ylab="PM2.5 Emission",main="Total PM2.5 Emission in Each Year")
dev.off()

#plot2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
B <- subset(NEI,fips == "24510")

pm25_sum <- aggregate(Emissions~year,data=B,sum)
png(filename = "plot2.png")
barplot(pm25_sum$Emissions,names.arg=pm25_sum$year,ylab="PM2.5 Emission",main="Total PM2.5 Emission of  Baltimore City in Each Year")
dev.off()

#plot3
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
B <- subset(NEI,fips == "24510")

pm25_sum <- aggregate(Emissions~year + type,data=B,sum)
library(ggplot2)
png(filename = "plot3.png")
g <- ggplot(pm25_sum,aes(year,Emissions))
g <- g + geom_line() + geom_point() + facet_grid(. ~ type)
print(g)
dev.off()



