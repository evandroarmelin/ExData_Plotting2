#filter Baltimore City data
NEI_Balt <- subset(NEI, NEI$fips == "24510")

#aggregate data
aggNEI_Balt <- aggregate(NEI_Balt$Emissions, by = list(NEI_Balt$year), sum)

#set the right names for the variables in the aggNEI frame
names(aggNEI_Balt) <- c("year", "Emissions")

# activate the png device
png(filename = "plot2.png", width = 900, height = 600)

# build the exploratory graph
barplot(aggNEI_Balt$Emissions, names.arg = aggNEI_Balt$year, xlab = "Years", ylab = "Total Emissions, PM25", main = "Baltimore Emissions")

#shut down the device
dev.off()