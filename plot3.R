# load ggplot2 library 
library(ggplot2)
#  Read Data  
NEI <- readRDS("summarySCC_PM25.rds") 

 
#  Create Plot Data from Baltimore City 
BC <- subset(NEI, fips == "24510")  
pd <- aggregate(BC[c("Emissions")], list(type = BC$type, year = BC$year), sum) 

 
#  Create Plot using ggplot
png('plot3.png', width=480, height=480) 
p <- ggplot(pd, aes(x=year, y=Emissions, colour=type)) + geom_point(alpha=.3) + geom_smooth(alpha=.2, size=1, method="loess") + ggtitle("Total Emissions by Type in Baltimore City") 
print(p) 
dev.off() 
