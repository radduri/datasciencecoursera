library("data.table")
library("ggplot2")

setwd("D:/Datascience/courcera-datascience/04_Exploratory_Data_Analysis/project2")
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

summarySourceClassificationData <- data.table::as.data.table(x = readRDS("summarySCC_PM25.rds"))
sourceClassificationData <- data.table::as.data.table(x = readRDS("Source_Classification_Code.rds"))

vehiclesSCC <- sourceClassificationData[grepl("vehicle", sourceClassificationData$SCC.Level.Two, ignore.case=TRUE)
                   , SCC]
vehiclessummarySourceClassificationData <- summarySourceClassificationData[summarySourceClassificationData[, SCC] %in% vehiclesSCC,]

baltimoreVehiclessummarySourceClassificationData <- vehiclessummarySourceClassificationData[fips=="24510",]

png("plot5.png")

ggplot(baltimoreVehiclessummarySourceClassificationData,aes(factor(year),Emissions)) +
  geom_bar(stat="identity", fill ="#FF9999" ,width=0.75) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()
