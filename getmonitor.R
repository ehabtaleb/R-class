pad3 <- function(n) {
  ch<- as.character(n)
  if(n < 100){
    ch<-paste("0",ch, sep="")
  }
  if(n < 10){
    ch<-paste("0",ch, sep="")
  }
  ch
}

getmonitor <- function(id, directory, summarize = FALSE) {
  
  dd <- paste(getwd(), .Platform$file.sep , directory, sep="")
  chid <-""
  if(is.character(id)){
    chid<-id
  }else{
    chid<-pad3(id)
  }
  ##print(chid)
  ##print(dd)
  fileName<-dir(dd, pattern = chid ,full.names=TRUE)
  ##print( fileName)
  dataa<-read.csv(fileName)
  if(summarize){
    print(summary(dataa))
  }
  dataa
}

