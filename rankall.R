rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Read outcome data
  heartAttackidx <- 11
  heartFailureidx <- 17
  pneumoniaidx <- 23
  
  data<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[,heartAttackidx] <- suppressWarnings(as.numeric(data[,heartAttackidx]))
  data[,heartFailureidx] <- suppressWarnings(as.numeric(data[,heartFailureidx]))
  data[,pneumoniaidx] <- suppressWarnings(as.numeric(data[,pneumoniaidx]))
  
  outcomeState <- data
  outcome <- "heart attack"
  num <- 1
  
  if(num == "best"){
    num <- 1
  }else if( num == "worst"){
    num = -1
  }else{
    num = as.numeric(num)
  }
  if (outcome=="heart attack") {
    ordereddf(heartAttackidx, num)
  }
  else if (outcome=="heart failure") {
    ordereddf(heartFailureidx, num)
  } else { 
    ordereddf(pneumoniaidx, num)
  } 
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}


ordereddf <- function(idx, num){
  if(num == -1){
    df<-outcomeState[order(-outcomeState[,idx],outcomeState[,2],na.last=NA),]   
    num<- 1
  }else{
    df <- outcomeState[order(outcomeState[,idx],outcomeState[,2],na.last=NA),] 
  }
  print (df[num:5, c(2, 7)])
}