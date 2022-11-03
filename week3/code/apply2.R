#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: apply2.R
#Description: applying family functions, taking input 
#Date: Oct 2022

#Clear workspace
rm(list=ls())


#apply family function 
#some operation - takes v as input
#if the sum of v is greater than 100 the it multiplies it by 100
SomeOperation <- function(v) { #takes input as v 
  if(sum(v) > 0){ #note that sum(v) is a single scalar value
    return (v * 100)
  } else {
      return (v)
    }
}

M <- matrix(rnorm(100), 10, 10)
print (apply(M, 1, SomeOperation))