count<-function(cause = NULL){
  if(is.null(cause)) stop("Empty Cause")
  cause_vec <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown") 
  
  if(!(cause %in% cause_vec)) stop("Invalid Cause")
  
  reg_vec <- c("<dd>[Cc]ause: [Aa]sphyxiation",
             "<dd>[Cc]ause: [Bb]lunt [Ff]orce",
             "<dd>[Cc]ause: [Oo]ther",
             "<dd>[Cc]ause: [Ss]hooting",
             "<dd>[Cc]ause: [Ss]tabbing",
             "<dd>[Cc]ause: [Uu]nknown")

  reg_matrix <- rbind(cause_vec, reg_vec)
  causeIdx <- grep(cause, cause_vec)
  search_reg <- reg_matrix[2, causeIdx]
  
  homicides <- readLines("homicides.txt")
  length(vv<-grep(search_reg, homicides))
  
}