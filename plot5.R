#get the SCC codes for emission related to motor vehicles
SCC_motor <- as.character(SCC$SCC[grepl("motor",SCC$Short.Name, ignore.case = TRUE)])

#filter emissions data for coal combustion related emission in Baltimore City
NEI_motor_balt <- subset(NEI, NEI$SCC %in% SCC_motor & fips == "24510")

#aggregate data
aggNEI_motor_balt <- aggregate(NEI_motor_balt$Emissions, by = list(NEI_motor_balt$year), sum)

#set the right names for the variables in the aggNEI frame
names(aggNEI_motor_balt) <- c("year", "Emissions")

# activate the png device
png(filename = "plot5.png", width = 900, height = 600)

# build the exploratory graph
barplot(aggNEI_motor_balt$Emissions, names.arg = aggNEI_motor_balt$year, xlab = "Years", ylab = "Total Emissions, PM25", main = "Baltimore Emissions from Motor Vehicles")

#shut down the device
dev.off()