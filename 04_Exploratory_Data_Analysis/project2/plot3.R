library("data.table")
library("ggplot2")

setwd("D:/Datascience/courcera-datascience/04_Exploratory_Data_Analysis/project2")
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

summarySourceClassificationData  <- data.table::as.data.table(x = readRDS("summarySCC_PM25.rds"))
sourceClassificationData <- data.table::as.data.table(x = readRDS("Source_Classification_Code.rds"))

baltimoresourceClassificationData <- summarySourceClassificationData[fips=="24510",]

png("plot3.png")

ggplot(baltimoresourceClassificationData,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()