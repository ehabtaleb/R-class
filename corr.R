corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  v<-double()
  files<-list.files(directory)
  
  for( e in files){

    filename <- paste0(getwd(),.Platform$file.sep,directory,.Platform$file.sep, e, sep="")
    ##print(filename)
    dataa <- read.csv(filename)
    ok<-complete.cases(dataa["sulfate"],dataa["nitrate"])
    completeData<-subset(dataa, ok)
    nr <- nrow(completeData)
    ##print(nr)
    if(!nr <= threshold){
      cc<-cor(dataa["sulfate"], dataa["nitrate"], use = "na.or.complete")
      v<-append(v, cc)  
    }
  }
  v
}

source("http://spark-public.s3.amazonaws.com/compdata/scripts/corr-test.R")
corr.testscript()