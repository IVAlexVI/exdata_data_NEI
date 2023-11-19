## Make some preparation steps by setting wd, loading libraries (if required), 
## and reading files with data
setwd("D:/Education/R/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Finding sum values of pm2.5 for each year
sum_year <- aggregate(Emissions ~ year, subset(NEI, fips ==24510), sum, na.rm = TRUE)

## Plotting graph#2 and saving as "plot2.png"
png("plot2.png", width=480, height=480)
with(sum_year, plot(year, Emissions, pch=19, type="b", 
                     ylab="Total emitted pm2.5 in Baltimore City, tons", xlab="Year", col="red"))
dev.off()

