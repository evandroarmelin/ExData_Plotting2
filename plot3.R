#load ggplot2 library
library(ggplot2)

#filter Baltimore City data
NEI_Balt <- subset(NEI, NEI$fips == "24510")

#aggregate data
aggNEI_Balt_Type <- aggregate(NEI_Balt$Emissions, by = list(NEI_Balt$year, NEI_Balt$type), sum)

#set the right names for the variables in the aggNEI frame
names(aggNEI_Balt_Type) <- c("year", "Type","Emissions")

# build the exploratory graph
g <- ggplot(aggNEI_Balt_Type, aes(x = factor(year), y = Emissions))
g + geom_bar(stat = "identity") + facet_grid(.~Type) + xlab("Years") + ylab("Total Emissions, PM25") + ggtitle("Baltimore Emissions by Type of Source")

#print graph to file
ggsave("plot3.png", width=9, height=6, dpi=100)