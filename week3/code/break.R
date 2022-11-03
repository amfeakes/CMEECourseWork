#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: break.R
#Description: how to break out of loops
#Date: Oct 2022


#Clear workspace
rm(list=ls())

#breaking out of loops 
#need to break out when a condition is met 

i<- 0 #Initilise i
  while (i < Inf) {
    if (i==10) {
      break
    } else { #break out of the while loop
        cat("i equals", i, "\n")
        i <- i + 1 #update i
        }
  }