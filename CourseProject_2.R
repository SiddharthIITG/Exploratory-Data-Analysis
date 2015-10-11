NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library("ggplot2")
library("dplyr")

#part1
grouping = group_by(NEI, year)
summarized_year = summarise(grouping, sum(Emissions))
qplot(summarized_year[[1]],summarized_year[[2]], xlab = "Year", ylab= "Emissions", geom = "bar", stat="identity")

#part2
NEI_Baltimore = NEI[NEI[[1]]=="24510", ]
grouping_Baltimore = group_by(NEI_Baltimore, year)
summarized_Baltimore = summarise(grouping_Baltimore, sum(Emissions))
qplot(summarized_Baltimore[[1]],summarized_Baltimore[[2]], xlab = "Year", ylab= "Emissions in Baltimore", geom = "bar", stat="identity")

#part3
grouping_Baltimore_type = group_by(NEI_Baltimore, type)
summarized_Baltimore_type = summarise(grouping_Baltimore_type, sum(Emissions))
qplot(summarized_Baltimore_type[[1]],summarized_Baltimore_type[[2]], xlab = "Type", ylab= "Emissions", geom = "bar", stat="identity")

#part4
SCC_coal = subset(SCC, grepl("Coal", SCC.Level.Three) & grepl("Combustion",SCC.Level.One ))
merged_coal = merge(SCC_coal, NEI, by="SCC")
grouping_coal = group_by(merged_coal, year)
summarized_year_coal = summarise(grouping_coal, sum(Emissions))
qplot(summarized_year_coal[[1]],summarized_year_coal[[2]], xlab = "Year", ylab= "Emissions by coal combustion", geom = "bar", stat="identity")

#part5
SCC_vehicles = subset(SCC, grepl("Vehicle", SCC.Level.Two))
merged_vehicles = merge(SCC_vehicles, NEI_Baltimore, by="SCC")
grouping_baltimore_year = group_by(merged_vehicles, year)
summarized_balti_vehicles = summarise(grouping_baltimore_year, sum(Emissions))
qplot(summarized_balti_vehicles[[1]],summarized_balti_vehicles[[2]], xlab = "Year", ylab= "Emissions", geom = "bar", stat="identity")

#part6
