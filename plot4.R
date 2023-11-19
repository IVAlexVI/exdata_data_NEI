## Make some preparation steps by setting wd, loading libraries (if required), 
## and reading files with data
library(ggplot2)
setwd("D:/Education/R/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Finding sum values of pm2.5 for each year
coal_values <- subset(Source_Classification_Code, grepl("Coal", EI.Sector, ignore.case = TRUE), 
                      select = c(SCC))
sum_year <- aggregate(Emissions ~ year, data = subset(NEI, SCC %in% coal_values$SCC),
                      sum, na.rm = TRUE)

## Plotting graph#4 and saving as "plot4.png"
png("plot4.png", width=480, height=480)
with(sum_year, plot(year, Emissions, pch=19, type="b", ylab="Total emitted pm2.5 (coal comb), tons",
                    xlab="Year", col="brown"))
dev.off()

