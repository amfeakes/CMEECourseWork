#Author: Amy Feakes
#Script: preallocate.R
#Description: understanding preallocation to use fewer operations 
#Date: Oct 2022

#pre-allocation 
#this loop resizes a vector repeatdely - each time using more memory, that makes it slow 
nopreallofun<- function(x) {
  a <- vector() #empty vector
  for (i in 1:x) {
    a <- c(a,i) #concatenate
    #print(a)
    #print(object.size(a))
  }
}

print(system.time(nopreallofun(1000)))

####################
#this pre-allocates a vector that fits all values 
#- it does not therefore have to be realocated to more memory for each iteration 

preallocfun<- function(x) {
  a <- rep(NA, x) #pre-allocated vector
  for (i in 1:x) {
    a[i] <- i #assign
    #print(a)
    #print(object.size(a))
  }
}

print(system.time(preallocfun(1000)))
