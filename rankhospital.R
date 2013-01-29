rankhospital <- function(state, outcome, num = "best") {
  
  outcomeState <- hospitalInState(state, outcome)
  
  if(num == "best"){
    num <- 1
  }else if( num == "worst"){
    num = -1
  }else{
    num = as.numeric(num)
  }

  
  if (outcome=="heart attack") {
    if(num == -1){
      df<-outcomeState[order(-outcomeState[,11],outcomeState[,2],na.last=NA),]   
      num<- 1
    }else{
      df <- outcomeState[order(outcomeState[,11],outcomeState[,2],na.last=NA),] 
    }
    print (df[num,2])
  } else if (outcome=="heart failure") {
    if(num == -1){
      df = outcomeState[order(-outcomeState[,17],outcomeState[,2],na.last=NA),] 
      num<- 1
    }else{
      df = outcomeState[order(outcomeState[,17],outcomeState[,2],na.last=NA),]        
    }
    print (df[num,2])
  } else {
    if(num == -1){
      df = outcomeState[order(-outcomeState[,23],outcomeState[,2],na.last=NA),]   
      num<- 1
    }else{
      df = outcomeState[order(outcomeState[,23],outcomeState[,2],na.last=NA),]
    }
    print (df[num,2])
  } 
  

}

hospitalInState <- function(state, outcome){
  
  ## Read outcome data
  data<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[,11] <- suppressWarnings(as.numeric(data[,11]))
  data[,17] <- suppressWarnings(as.numeric(data[,17]))
  data[,23] <- suppressWarnings(as.numeric(data[,23]))
  
  outcome_vec <- c("heart attack", "heart failure", "pneumonia") 
  if(!(outcome %in% outcome_vec)) stop("Invalid Outcome")
  
  outcomeState <- subset(data, data$State == state)
  
  ##print(outcomeState)
  if(nrow(outcomeState) == 0){
    stop("invalid state")
  }
  
  outcomeState
  
}
