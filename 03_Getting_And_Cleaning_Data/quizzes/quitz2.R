library(jsonlite)
library(httpuv)
library(httr)

oauth_endpoints("github")

myapp<- oauth_app(appname = "", key="", secret = "01f71d6e2690f4be11cc21c79a834880efa98db9 ")


connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(connection)
close(connection)
c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))
