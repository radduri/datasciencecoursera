setwd("D:/Datascience/courcera-datascience/03_Getting_And_Cleaning_Data")
getwd()

if(file.exists("./data")) {dir.create("./data")}

fileUrl<- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv", method ="curl")
restData<-read.csv("./data/restaurants.csv")
##restData

s1<-seq(1,10,by=2); s1
s2<-seq(1,10,length=3); s2

restData$nearMe = restData$neighborhood %in% c("Roland PArk", "Homeland")
restData$nearMe

restData$zipWrong = ifelse(restData$zipCode<0, TRUE, FALSE)
restData$zipWrong

table(restData$zipWrong, restData$zipCode<0)

restData$zipGroups = cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups)

table(restData$zipGroups,restData$zipCode)

library(Hmisc)
restData$zipGroups =cut2(restData$zipCode, g=4)
table(restData$zipGroups)

restData$zcf <- factor(restData$zipCode)

restData$zcf[1:10]

class(restData$zcf)


library(plyr)

restData2<-mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)


library(reshape2)
head(mtcars)
