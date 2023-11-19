## Make some preparation steps by setting wd, loading libraries (if required), 
## and reading files with data
library(ggplot2)
setwd("D:/Education/R/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Finding sum values of pm2.5 for each year
sum_year <- aggregate(Emissions ~ year+type, subset(NEI, fips ==24510), sum, na.rm = TRUE)

## Plotting graph#3 and saving as "plot3.png"
png("plot3.png", width=480, height=480)
g<-ggplot(sum_year, aes(year, Emissions, color = type))
g+geom_point(size = 2)+geom_line()+theme_bw()+labs(x="Year", y="Emitted pm2.5 in Baltimore City, tons")
dev.off()

