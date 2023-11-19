## Make some preparation steps by setting wd, loading libraries (if required), 
## and reading files with data
library(ggplot2)
setwd("D:/Education/R/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Finding sum values of pm2.5 for each year emitted by vehicles in Baltimore City
vehicles_values <- subset(Source_Classification_Code, grepl("vehicles", EI.Sector, ignore.case = TRUE), 
                      select = c(SCC))
sum_year <- aggregate(Emissions ~ year, data = subset(NEI, SCC %in% vehicles_values$SCC & fips ==24510),
                      sum, na.rm = TRUE)

## Plotting graph#5 and saving as "plot5.png"
png("plot5.png", width=480, height=480)
with(sum_year, plot(year, Emissions, pch=19, type="b", ylab="Emitted pm2.5 by vehicles (Baltimore City), tons",
                    xlab="Year", col="blue"))
dev.off()

