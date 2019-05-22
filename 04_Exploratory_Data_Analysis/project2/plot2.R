library("data.table")
setwd("D:/Datascience/courcera-datascience/04_Exploratory_Data_Analysis/project2")
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

sourceClassificationData <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
summarySourceClassificationData <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

summarySourceClassificationData[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]
totalsummarySourceClassificationData <- summarySourceClassificationData[fips=='24510', lapply(.SD, sum, na.rm = TRUE)
                , .SDcols = c("Emissions")
                , by = year]

png(filename='plot2.png')

barplot(totalsummarySourceClassificationData[, Emissions]
        , names = totalsummarySourceClassificationData[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")

dev.off()