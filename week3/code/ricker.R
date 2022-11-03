#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: ricker.R
#Description: Runs a simulation of the ricker model
#Date: Oct 2022

#Clear workspace
rm(list=ls())

ricker <-function(N0=1, r=1, K=10, generations=50)
{
  #runs a simulation of the ricker model 
  #returns a vector of length generations

  N <- rep(NA, generations) #Creates a vector of NA
  
  N[1] <- N0
  for(t in 2:generations)
  {
    N[t] <- N[t-1] * exp(r*(1.0-(N[t-1]/K)))
  }
  return (N)
}

plot(ricker(generations=10), type="l")
