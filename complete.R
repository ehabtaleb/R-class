complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  df<-NULL
  for(e in id){
    
    filename <- sprintf(paste0(getwd(),.Platform$file.sep,directory,.Platform$file.sep,"%03d.csv", sep=""), e)
    filename
    dataa <- read.csv(filename)
    ok<-complete.cases(dataa["sulfate"], dataa["nitrate"])
    
    rbind(df,data.frame(id=e, nobs=sum(ok)))->df 
    
  }
  print(df)
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}

