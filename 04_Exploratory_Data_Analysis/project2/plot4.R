library("data.table")
library("ggplot2")

setwd("D:/Datascience/courcera-datascience/04_Exploratory_Data_Analysis/project2")
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

summarySourceClassificationData <- data.table::as.data.table(x = readRDS("summarySCC_PM25.rds"))
sourceClassificationData <- data.table::as.data.table(x = readRDS("Source_Classification_Code.rds"))

combustionRelated <- grepl("comb", sourceClassificationData[, SCC.Level.One], ignore.case=TRUE)
coalRelated <- grepl("coal", sourceClassificationData[, SCC.Level.Four], ignore.case=TRUE) 
combustionsourceClassificationData <- sourceClassificationData[combustionRelated & coalRelated, SCC]
combustionsummarySourceClassificationData <- summarySourceClassificationData[summarySourceClassificationData[,SCC] %in% combustionsourceClassificationData]

png("plot4.png")

ggplot(combustionsummarySourceClassificationData,aes(x = factor(year),y = Emissions/10^5)) +
  geom_bar(stat="identity", fill ="#FF9999", width=0.75) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()
