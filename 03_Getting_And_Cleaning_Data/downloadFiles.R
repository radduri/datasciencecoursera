##Set Working Directory to the current Cource Directory
setwd("courcera-datascience/03_Getting_And_Cleaning_Data")

##Create Data Directory to store all the data files
if(!file.exists("data"))
{
    dir.create("data")
}

##Download CSV Transport camera data from the site
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv", method="curl")
list.files("./data")

#Recorded download Data date
dateDownloaded<-date()

##dateDownloaded

##cameraData<- read.table("./data/cameras.csv", sep=",", header = TRUE)
cameraData<- read.csv("./data/cameras.csv", header = TRUE, quote = "")

head(cameraData)

##Download EXCEL version camera data file from the site
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.tsv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.xlsx", method="curl")
list.files("./data")

dateDownloaded<-date()

library(xlsx)
cameraData<-read.xlsx('./data/cameras.xlsx', sheetIndex=1,header=TRUE)
head(cameraData)

##Download XML Transport camera data from the site

fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xml?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.xml", method="curl")
list.files("./data")
dateDownloaded<-date()

library(XML)
cameraData<-xmlTreeParse('./data/cameras.xml',useInternal=TRUE)
rootNode<-xmlRoot(cameraData)
xmlNode(rootNode)




doc<-xmlTreeParse('http://www.espn.com/nfl/team/_/name/bal/baltimore-ravens',useInternal=TRUE)

doc

scores<-xpathSApply(doc,"//li[@class='score']",xmlValue)

teams<-xpathSApply(doc,"//li[@class='team-name']",xmlValue)
scores


##Download JSON Transport Camera data from the site.
library(jsonlite)
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.json?accessType=DOWNLOAD"
jsonData<-fromJSON(fileUrl, )
myjson<- fromJSON(as.character(jsonData$meta$view))

jsonData.meta


tables()

library(data.table)
DF=data.frame(x=rnorm(9), y=rep(c("a","b","c"),each=3),z=rnorm(9))
DF

#create a data table
DT=data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

tables()

#subset first 2 rows
DT[2,]

DT[DT$y=="a",]

##ubset based on the rows
DT[c(2,3),]

##subset based on columns
DT[,c(2,3)]

##expression
k={print(10);5}
k
print(k)

##mean of x, and sum of z
DT[,list(mean(x),sum(z))]

##Add new column
DT[,w:=z^2]
DT

##copy data table

DT2<-DT
DT2

##Add column based on the expression (multi step operations)
DT[,m:={tmp<-(x+z); log2(tmp+5)}]
DT


##Plyr like operations
DT[,a:=x>0]
DT

DT[,b:=mean(x+w), by=a]
DT

##Special variables
DT<-data.table(x=sample(letters[1:3],1E5,TRUE))
DT[,.N ,by=x]


##Keys
DT<-data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))
setkey(DT,x)
DT['a']


###Joins
DT1<-data.table(x=c('a','a','b','dt1'),y=1:4)
DT2<-data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT1,'x');setkey(DT2,x)
merge(DT1,DT2)




fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/quitz.csv", method="curl")
list.files("./data")

#Recorded download Data date
dateDownloaded<-date()

##dateDownloaded

##cameraData<- read.table("./data/cameras.csv", sep=",", header = TRUE)
quitzData1<- read.csv("./data/quitz.csv", header = TRUE, quote = "")
names(quitzData1)
head(quitzData1)