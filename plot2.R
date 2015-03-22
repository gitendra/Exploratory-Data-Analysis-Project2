#  Read Data  
NEI <- readRDS("summarySCC_PM25.rds") 
 
#  Create Plot Data from Baltimore City 
BC <- subset(NEI, fips == "24510") 
pd <- aggregate(BC[c("Emissions")], list(year = BC$year), sum) 

#  Create Plot 
png('plot2.png', width=480, height=480) 
plot(pd$year, pd$Emissions, type = "l", main = "Total Emissions from PM2.5 in Baltimore City", xlab = "Year", ylab = "Emissions") 
dev.off() 

