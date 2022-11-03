#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: GPDD_Data.R
#Description: Mapping with the GPDD database
#Date: Oct 2022

#Clear workspace
rm(list=ls())

#Dependencies
require(maps)

#load the data
load("../data/GPDDFiltered.RData")

#load maps package

#create world map 
map()

#superimposing all the locations on the map 
points(gpdd, col="Red")
 
#what biases might you expect in any anaylses of the data represented?
#the points are all within a small region - clustered in and around Europe, the anaylses of this data 
#would be regionally biased, and not equally spread on a global scale. 