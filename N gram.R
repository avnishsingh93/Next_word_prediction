# Required Packages

library(tidyverse)
library(quanteda)
library(textclean)
library(stringr)
library(ngram)
library(tm)


# Reading files

blog=readLines("Coursera-SwiftKey/final/en_US/en_US.blogs.txt",encoding = "UTF-8")
news=readLines("Coursera-SwiftKey/final/en_US/en_US.news.txt",encoding = "UTF-8")
twitt=readLines("Coursera-SwiftKey/final/en_US/en_US.twitter.txt",encoding = "UTF-8",skipNul = TRUE)

# Storing 10 % of each file and making one large file.
y=round(0.1*length(news))
news=sample(news,y)
x=round(0.1*length(blog))
blog=sample(blog,x)
z=round(0.1*length(twitt))
tweet=sample(twitt,z)
combine=c(blog,news,twitt)

# Corpus prep
combine=replace_contraction(combine,contraction.key = lexicon::key_contractions,ignore.case = TRUE)
corpus=corpus(combine)

# Unigram
tokens=tokens(corpus,
                   what = "word",
                   remove_numbers = TRUE,
                   remove_punct = TRUE,
                   remove_symbols = TRUE,
                   remove_hyphens = TRUE,
                   remove_url = TRUE,
                   remove_twitter=TRUE
)
tokens=tokens_tolower(tokens)
bigram=tokens_ngrams(tokens,n=2,concatenator = " ")
trigram=tokens_ngrams(tokens,n=3,concatenator = " ")
quadgram=tokens_ngrams(tokens,n=4,concatenator = " ")

bigram=dfm(bigram,tolower = FALSE)
trigram=dfm(trigram,tolower = FALSE)
quadgram=dfm(quadgram,tolower = FALSE)

# Creating df with grams and their respective frequency.

a=textstat_frequency(bigram)[,1:2]
b=textstat_frequency(trigram)[,1:2]
c=textstat_frequency(quadgram)[,1:2]

a=a%>%filter(frequency>3)
b=b%>%filter(frequency>4)
c=c%>%filter(frequency>4)

# Bar plot for top 50 bigrams trigrams and quadgrams

g1=a[1:50,1:2]%>%ggplot(aes(x=feature,y=frequency))+geom_bar(fill = "#0073C2FF", stat = "identity")+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
g2=b[1:50,1:2]%>%ggplot(aes(x=feature,y=frequency))+geom_bar(fill = "#0073C2FF", stat = "identity")+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
g3=c[1:50,1:2]%>%ggplot(aes(x=feature,y=frequency))+geom_bar(fill = "#0073C2FF", stat = "identity")+theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

saveRDS(a,"bigram.data")
saveRDS(b,"trigram.data")
saveRDS(c,"quadgram.data")






