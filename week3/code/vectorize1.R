#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: vectorize1.R
#Description: vectorisation to su, all elements of a matrix 
#Date: Oct 2022

#Clear workspace
rm(list=ls())

M <- matrix(runif(1000000),1000,1000)

sumallelements <- function(M) { #this sums all the elements of a matrix
  dimensions <- dim(M)
  tot <- 0
  for (i in 1:dimensions[1]) {
    for (j in 1:dimensions[2]) {
      tot <- tot + M[i, j]
    }
  } 
  return(tot)
}

print("Using loops, the time taken is:")
print(system.time(sumallelements(M))) 
#system.time calculates how much time your code takes to run 
print("Using the in-built vectorized function, the time taken is:")
print(system.time(sum(M))) #this is fasters than sumallelements as it is an inbuilt function 
                        #the inbuilt function uses vectorization 

