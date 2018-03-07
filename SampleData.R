# Sampling Representative Data

setwd("C:/Users/bamini/Documents/Coursera/Capstone/final/en_US")


blogs <- readLines("en_US.blogs.txt", encoding = "UTF-8")
twitter <- readLines("en_US.twitter.txt", skipNul = TRUE, encoding = "UTF-8")

news.con <- file('en_US.news.txt','rb')
news <- readLines(news.con, encoding = "UTF-8")
close(news.con)

blogs <- iconv(blogs, "UTF-8", "ASCII", sub="")
twitter <- iconv(twitter, "UTF-8", "ASCII", sub="")
news <- iconv(news, "UTF-8", "ASCII", sub="")

# Sampling ~5000 lines of each of the data sets
set.seed(123)
bset <- rbinom(length(blogs), 1, 0.25)
sampleb <- blogs[which(bset %in% 1)]

set.seed(987)
tset <- rbinom(length(twitter), 1, 0.25)
samplet <- twitter[which(tset %in% 1)]

set.seed(106)
nset <- rbinom(length(news), 1, 0.25)
samplen <- news[which(nset %in% 1)]

# Combining sub-sample from blogs, twitter and news
sample <- c(sampleb, samplet, samplen)
writeLines(sample, "C:/Users/bamini/Documents/Coursera/Capstone/final/en_US/sample25.txt", useBytes = TRUE)
