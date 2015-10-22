#get the SCC codes for emission related to motor vehicles
SCC_motor <- as.character(SCC$SCC[grepl("motor",SCC$Short.Name, ignore.case = TRUE)])

#filter emissions data for coal combustion related emission in Baltimore City
NEI_motor_cities <- subset(NEI, NEI$SCC %in% SCC_motor & fips %in% c("24510", "06037"))


#aggregate data
aggNEI_motor_cities <- aggregate(NEI_motor_cities$Emissions, by = list(NEI_motor_cities$year,NEI_motor_cities$fips), sum)

#set the right names for the variables in the aggNEI frame
names(aggNEI_motor_cities) <- c("year", "fips", "Emissions")

#write the names for the counties
aggNEI_motor_cities$county[aggNEI_motor_cities$fips == "06037"] <- "Los Angeles County"
aggNEI_motor_cities$county[aggNEI_motor_cities$fips == "24510"] <- "Baltimore County"

# build the exploratory graph
g <- ggplot(aggNEI_motor_cities, aes(x = factor(year), y = Emissions, group = county))
g + geom_line(aes(colour = county)) + xlab("Years") + ylab("Total Emissions, PM25") + ggtitle("Emissions Comparison")

#print graph to file
ggsave("plot6.png", width=9, height=6, dpi=100)