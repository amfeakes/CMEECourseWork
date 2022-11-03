#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: apply1.R
#Description: applying family functions 
#Date: Oct 2022

#Clear workspace 
rm(list=ls())


#apply family functions 
#example of use - to apply a function to the rows of a matrix

##Build a random matrix
M <- matrix(rnorm(100), 10, 10)

##Take the mean of each row
RowMeans <- apply(M, 1, mean)  #the data, where to 1 for rows 2 for column, what - mean 
print (RowMeans)

#Now the varience 
RowVars <- apply(M, 1, var)
print(RowVars)

#By column
ColMeans <- apply(M, 2, mean)
print (ColMeans)


