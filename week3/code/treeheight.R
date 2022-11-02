#Author: Amy Feakes
#Script: treeheight.R
#Description: Practical work using functions 
#Date: Oct 2022


###DESCRIPTION####
# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees: The angle of elevation of tree
# distance: The distance from base of tree (e.g., meters)

####INPUT####
treedata <-read.csv("../data/trees.csv") #read in the df
# head(treedata) #checking the df has been read in 

####CALCULATIONS####
# The heights of the tree, same units as "distance"
treeheight<- function(degrees, distance) {
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    # print(paste("Tree height is:", height))
    
    return(height)
}

####ADD TO DF####
# Adds a column to tree data, <- 
#this takes the degrees and distance column to put into the tree height calcutioant above 

treedata$Height<- treeheight(treedata$Angle.degrees,treedata$Distance.m)


####OUTPUT####
#need to create a new csv which has the old csv with an additional column called Tree.Height.m
#this file is named treehts.csv and should be in results 
#treehts <- cbind(treedata,treeheight) #append tree height to the tree data data frame - if step above isnt done 
write.csv(treedata,"../results/TreeHts.csv") #write a new file .csv