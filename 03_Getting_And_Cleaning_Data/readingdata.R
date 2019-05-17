setwd("D:/Datascience/courcera-datascience/03_Getting_And_Cleaning_Data")

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

library(XML)
con<-url("https://www.ooredoo.qa/portal/OoredooQatar/home")
htmlCode = readLines(con)
close(con)
htmlCode

xpathSApply(htmlCode,"//title", xmlValue)