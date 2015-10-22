#get the SCC codes for emission related to coal combustion
SCC_coal <- as.character(SCC$SCC[grepl("coal",SCC$Short.Name, ignore.case = TRUE)])

#filter emissions data for coal combustion related emission
NEI_coal <- subset(NEI, NEI$SCC %in% SCC_coal)

#aggregate data
aggNEI_coal <- aggregate(NEI_coal$Emissions, by = list(NEI_coal$year), sum)

#set the right names for the variables in the aggNEI frame
names(aggNEI_coal) <- c("year", "Emissions")

# activate the png device
png(filename = "plot4.png", width = 900, height = 600)

# build the exploratory graph
barplot(aggNEI_coal$Emissions, names.arg = aggNEI_coal$year, xlab = "Years", ylab = "Total Emissions, PM25", main = "Total Emissions from Coal Combustion")

#shut down the device
dev.off()