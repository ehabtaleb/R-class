best <- function(state, outcome) {
 
  ## Read outcome data
  data<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[,11] <- suppressWarnings(as.numeric(data[,11]))
  data[,17] <- suppressWarnings(as.numeric(data[,17]))
  data[,23] <- suppressWarnings(as.numeric(data[,23]))
  
  outcomeState <- subset(data, data$State == state)
  
  ##print(outcomeState)
  if(nrow(outcomeState) == 0){
    stop("invalid state")
  }
  
  outcome_vec <- c("heart attack", "heart failure", "pneumonia") 
  
  if(!(outcome %in% outcome_vec)) stop("Invalid Outcome")
  
  if (outcome=="heart attack") { 
    df = outcomeState[order(outcomeState[,11],outcomeState[,2],na.last=NA),] 
    print (df[1,2])
    } else if (outcome=="heart failure") {
      df = outcomeState[order(outcomeState[,17],outcomeState[,2],na.last=NA),]
      print (df[1,2])
  } else {
    df = outcomeState[order(outcomeState[,23],outcomeState[,2],na.last=NA),] 
    print (df[1,2])
  } 
  
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}