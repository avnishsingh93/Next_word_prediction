library(tidyverse)
library(quanteda)
library(textclean)
library(stringr)
library(ngram)
library(tm)

a <- readRDS("bigram.data")
b <- readRDS("trigram.data") 
c <- readRDS("quadgram.data")

predictWord <- function(input) {
  as.character(input)
  input=tolower(input)
  input=removeNumbers(input)
  input=removePunctuation(input)
  if(wordcount(input)==1){
    funbigram(input)
  }
  else if(wordcount(input)==2){
    funtrigram(input)
  }
  else if(wordcount(input)>=3){
    funquadgram(input)
  }
}

funbigram=function(input){
  if(input %in% word(a$feature,start = 1,end = 1)){
    temp=filter(a,word(a$feature,start = 1,end = 1)==input)
    word(temp$feature,start = 2,end = 2,sep = " ")[1:3]
  }
  else
    return("it")
}
funtrigram= function(input){
  if(input %in% word(b$feature,start = 1,end = 2,sep = " ")){
    temp=filter(b,word(b$feature,start = 1,end = 2,sep = " ")==input)
    word(temp$feature,start = 3,end = 3,sep = " ")[1:3]
  }
  else{
    input=word(input,start = 1,end = 1,sep = " ")
    funbigram(input)
  }
}

funquadgram=function(input){
  input=word(input,start = wordcount(input)-2,end = wordcount(input),sep = " ")
  if(input %in% word(c$feature,start = 1,end = 3,sep = " ")){
    temp=filter(c,word(c$feature,start = 1,end = 3,sep = " ")==input)
    word(temp$feature,start = 4,end = 4,sep = " ")[1:3]
  }
  else{
    input=word(input,start = 1,end = 2,sep = " ")
    funtrigram(input)
  }
}