#Author: Amy Feakes
#Script: try.R
#Description: catching errors
#Date: Oct 2022


####CATCHING ERRORS####

#this function runs a simulation - taking the mean of a population
#ONLY if 30 unique samples are obtained (stop command)
doit <- function(x) {
  temp_x <- sample(x, replace =TRUE)
  if(length(unique(temp_x)) > 30) { #only take mean if sample was suffiecient 
    print(paste("Mean of this sample was:", as.character(mean(temp_x))))
    }
  else {
    stop("Couldnt calculate mean: too few unique vales!")
  }
}
#generates a population 
set.seed(1345) #again, to get the same results for illustration 
popn <- rnorm(500)
hist(popn)
#this repeats the sampling exerecies 15 times 
#lapply(1:15, function(i) doit(popn))
#using try function 
#false - supresses any error messages, but the results contain them
result <- lapply(1:15, function(i) try(doit(popn), FALSE)) 
class(result)
result #large output 
#to store the results manually, using a loop 
result<- vector("list", 15) #pre allocated
for(i in 1:15){
  result[[i]] <- try(doit(popn), FALSE)
}

  





