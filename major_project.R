library(readr)
library(readxl)
MyData<-read_csv("C:/Users/pc/Desktop/MajorProject/tweets.csv")
options(max.print=1000000)  
dt = sort(sample(nrow(MyData), nrow(MyData)*.7))
train<-MyData[dt,]
test<-MyData[-dt,]
dim(test)
print(test)
Tweet=MyData$TWEET


library(stringr)
Tweet<-gsub('[0-9]+', '', Tweet)
Tweet<-gsub("@\\w+ *", "", Tweet)# remove word after @
Tweet<-gsub("#\\w+ *", "", Tweet)# remove word after #
Tweet<-gsub('(RT|via)', '',Tweet)# removing RT n via
Tweet <- gsub("[^0-9A-Za-z///' ]","" , Tweet ,ignore.case = TRUE)
Tweet<-gsub('[[:punct:]]', '', Tweet)# remove punctuation
Tweet<-tolower(Tweet)
print(Tweet)




MyData2<-word_polarity <-read_excel("C:/Users/pc/Desktop/MajorProject/newPolarity.xlsx")
word<-MyData2$WORD
polarity<-MyData2$Polarity
print(word)

vr <- c()

for(i in 1:5)
{ print(Tweet[i])
  words.list = strsplit( Tweet[i], "\\s+")
  myarray=unlist(words.list, recursive = TRUE, use.names = TRUE)
  
  print(myarray)
  n=length(myarray)
  words.matches = match(myarray,word,nomatch = 2481)
  print(words.matches)
  
  for(i in 1:n)
  {
    print(myarray[i])
  }
  
  
  vr <- c()
  final_pr=0
  for (i in 1:length(words.matches)) { 
    vr[i] <- words.matches[i]
    value=vr[i]
    total_polarity=polarity[value]
    final_pr=final_pr+total_polarity
  }
  print(final_pr)
  
}

