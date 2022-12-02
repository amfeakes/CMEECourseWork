#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: script_1.R
#Description: Data wrangling the given dataset to move forward with model fitting
#Date: Nov 2022

#Clear workspace
rm(list=ls())

#Dependencies 

####Importing data  ####
data <- read.csv("../data/LogisticGrowthData.csv") #read in the data

#### Understanding data in Base R ####
# dim(data) #dimensions
# str(data) #basic structure
# head(data) 
# unique(data$PopBio_units)#the response variable has different units
# #units don't matter for model fitting  - depending on biological question - might need to merge
# unique(data$Time_units) #the independent variable has one unit, hours 

#need to create an id column - infer single growth columns by combining sp, medium, temp and citation (each unique)
data$ID <- paste(data$Species, data$Temp, data$Medium, data$Citation) ##here make it equal a number


#Check data for values of pop bio and time of zero 
data <- subset(data, Time>=0)
data <- subset(data, PopBio>0) #look at the pecentage of data you are loosing to make this decision 
  #can values actually be negative 

data$ID <- as.factor(data$ID)
# unique(data$ID)
#change ID form to numbers, the are 285 unique combinations 
levels(data$ID) <- 1:285

# summary(data$ID) # some datasets, ie ID groups, have fewer than 10 points #what is the level that is too small 
# View(df1)
#log pop bio 
data$log_PopBio= log(data$PopBio)

#ID for titles
data$data_title = paste(data$Species, data$Temp, data$Medium, sep="_")
# unique(data$data_title)

# get rid of small data sets 

write.csv(data , file = "../results/growthdata2.csv")
