#Author: Amy Feakes
#Script: basic_io.R
#Description: script to illustrate R input-output
#Date: Oct 2022


##A simple script to illustrate R input-output 
##Run line by line and check inputs outputs to understand what is happening 

mydata <- read.csv("../data/trees.csv", header = TRUE)#imports with headers

write.csv(mydata, "../results/mydata.csv") #write it out as a new file 

write.table(mydata[1,], file = "../results/mydata.csv",append=TRUE) #append to it 

write.csv(mydata, "../results/mydata.csv", row.names=TRUE) #write row names 

write.table(mydata, "../results/mydata.csv", col.names=FALSE) #ignore column names 
