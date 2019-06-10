##QUIZ 1

#Question 1 The en_US.blogs.txt |en_US.blogs.txt file is how many megabytes?

f1 <- file.info("data/en_US/en_US.blogs.txt")

fileMb <- (f1$size)/1000000
fileMb

#Question 2

## 2. The en_US.twitter.txt|en_US.twitter.txt has how many lines of text?

fCon <- file("data/en_US/en_US.twitter.txt", "r")
fLines <- readLines(fCon, skipNul = TRUE)
length(fLines)
close(fCon)

#Question 3 
# 3. Question 3 What is the length of the longest line seen in any of the three en_US data sets?

fPaths <- paste0("data/en_US/",
                    c("en_US.blogs.txt","en_US.news.txt","en_US.twitter.txt"))
for(fPath in fPaths) {
    print(fPath)
    con <- file(fPath,"r")
    texts <- readLines(con, n=-1, skipNul=TRUE)
    close(con)
    print(max(sapply(texts,nchar)))
    print(length(texts))
}

# 4. Question 4 In the en_US twitter data set, if you divide the number of lines where the word "love" (all lowercase) occurs by the number of lines the word "hate" (all lowercase) occurs, about what do you get?
fCon <- file("data/en_US/en_US.twitter.txt", "r")
fLines <- readLines(fCon,n=-1, skipNul = TRUE)
love <- length(grep("love",fLines))
hate <- length(grep("hate",fLines))
theThinLine <- love/hate
close(con)
theThinLine


#5. Question 5  The one tweet in the en_US twitter data set that matches the word "biostats" says what?
fCon <- file("data/en_US/en_US.twitter.txt", "r")
fLines <- readLines(fCon,n=-1, skipNul = TRUE)
biostatsTweet <- fLines[grep("biostats",fLines)]
close(con)
biostatsTweet

#6. Question 6  How many tweets have the exact characters "A computer once beat me at chess, but it was no match for me at kickboxing". (I.e. the line matches those characters exactly.)
fCon <- file("data/en_US/en_US.twitter.txt", "r")
fLines <- readLines(fCon,n=-1, skipNul = TRUE)
s <- "A computer once beat me at chess, but it was no match for me at kickboxing"
biostatsTweet <- fLines[grep(s,fLines)]
close(con)
biostatsTweet

