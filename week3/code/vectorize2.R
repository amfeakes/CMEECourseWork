#Author: Amy Feakes
#Script: Vectorize2.R
#Description: stochastic ricker model modifed 
#Date: Oct 2022

# Runs the stochastic Ricker equation with gaussian fluctuations

rm(list = ls())

stochrick <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2,numyears = 100)
{

  N <- matrix(NA, numyears, length(p0))  #initialize empty matrix

  N[1, ] <- p0

  for (pop in 1:length(p0)) { #loop through the populations

    for (yr in 2:numyears){ #for each pop, loop through the years

      N[yr, pop] <- N[yr-1, pop] * exp(r * (1 - N[yr - 1, pop] / K) + rnorm(1, 0, sigma)) # add one fluctuation from normal distribution
    
     }
  
  }
 return(N)
}

print("Non-Vectorized Stochastic Ricker takes:")
print(system.time(res2<-stochrick()))

# Now write another function called stochrickvect that vectorizes the above to
# the extent possible, with improved performance: 


rm(list = ls())

stochrickvect <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2,numyears = 100)
{
  
  N <- matrix(NA, numyears, length(p0))  #initialize empty matrix
  
  N[1, ] <- p0
  #for (pop in 1:length(p0)) { #loop through the populations
  #vecotrising by removing the for loop above and replaicng it with a random number code
  #only vecotrising the population as this can be random, the other loop (time) cannot be vectorised. 
  randyr <- rnorm(numyears, 0, sigma) #fluctuates for year popultion 
  #this generates a random number for each equivalent population number. 
    for (yr in 2:numyears){ #for each pop, loop through the years
      
      N[yr, ] <- N[yr-1, ] * exp(r * (1 - N[yr - 1, ] / K) + randyr[yr]) # add one fluctuation from normal distribution
      #removed pop and replaced with randyr[yr] vector at end 
      
  
  }
  return(N)
}


#need to vectorise pop - using apply 

print("Vectorized Stochastic Ricker takes:")
print(system.time(res2<-stochrickvect()))


#vectorised is faster! 


