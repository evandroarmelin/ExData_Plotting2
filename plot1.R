#aggregate data
aggNEI <- aggregate(NEI$Emissions, by = list(NEI$year), sum)

#set the right names for the variables in the aggNEI frame
names(aggNEI) <- c("year", "Emissions")

# activate the png device
png(filename = "plot1.png", width = 900, height = 600)

# build the exploratory graph
barplot(aggNEI$Emissions, names.arg = aggNEI$year, xlab = "Years", ylab = "Total Emissions, PM25", main = "United States Total Emissions")

#shut down the device
dev.off()