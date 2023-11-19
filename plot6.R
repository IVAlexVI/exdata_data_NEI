## Make some preparation steps by setting wd, loading libraries (if required), 
## and reading files with data
library(ggplot2)
setwd("D:/Education/R/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Finding sum values of pm2.5 for each year emitted by vehicles in Baltimore City
## and Los Angeles County, California
vehicles_values <- subset(Source_Classification_Code, grepl("vehicles", EI.Sector, 
              ignore.case = TRUE), select = c(SCC))
sum_year <- aggregate(Emissions ~ year+fips, data = subset(NEI, SCC %in% vehicles_values$SCC & 
               (fips == "24510" | fips == "06037")), sum, na.rm = TRUE)


## Plotting graph#6 and saving as "plot6.png"
png("plot6.png", width=480, height=480)
g<-ggplot(sum_year, aes(year, Emissions, color = fips))
g+geom_point(size = 2)+geom_line()+theme_bw()+labs(x="Year", y="Emitted pm2.5 by vehicles, tons")+
  scale_color_discrete(labels = c("Los Angeles County", "Baltimore City"))
dev.off()

