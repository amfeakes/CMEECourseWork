#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: datawrang.R
#Description: examples of data wrangling practices using tidyverse commands, on the pound hill data set 
#Date: Oct 2022 

#Clear workspace
rm(list=ls())

#Dependencies
require(tidyverse) 
#go through and change to tidyverse commands 
################## Wrangling the Pound Hill Dataset ############
####Tidyverse####


tidyverse_packages(include_self = TRUE) #load pacakgers to see conflicts

#### Load the dataset ####
# header = false because the raw data don't have real headers
MyData <- as.matrix(read.csv("../data/PoundHillData.csv", header = FALSE))

# header = true because we do have metadata headers
MyMetaData <- read.csv("../data/PoundHillMetaData.csv", header = TRUE, sep = ";")
#a second copy of the dats 
############# Inspect the dataset ###############

as_tibble(MyData) #converts data frame to a tibble #also reads the first part(head)
dim_desc(MyData) #dimensions 
glimpse(MyData) #str equivalent, but shows more 
View(MyData) #pops up another view 

#### Transpose ####
# rows to columns 
MyData <- t(MyData) 

#### Replace species absences with zeros ####
#true blanks (ie not NA) are 0 no species recorded, so need to change 
MyData[MyData == ""] = 0
#using dplyr #MyData <- replace_na(MyData,"0") - this doesn't work with pivot as it changes to str instead of number

##### Convert raw matrix to data frame #####

TempData <- as_tibble(MyData[-1,],stringsAsFactors = F) #stringsAsFactors = F is important!
colnames(TempData) <- MyData[1,] # assign column names from original data

#### Convert from wide to long format  ####

MyWrangledData<- TempData %>% pivot_longer(TempData, cols=5:45, names_to="Species", values_to="Count")
#View(MyWrangledData) #check
#now need to specify factors and strings 
#mutate acrosss applies it to many columns, as factor/as integer is the type 
#it is piped 
MyWrangledData <- MyWrangledData %>% 
mutate(across(c(Cultivation, Block, Plot, Quadrat, Species), as.factor))

MyWrangled.Data <- MyWrangledData %>% 
mutate(across(c(Count), as.integer))

############# Exploring the data (extend the script below) 


slice(MyWrangledData, 10:15) # Look at a particular range of data rows

glimpse(MyWrangledData) #like str(), but nicer!

filter(MyWrangledData, Count>100) #like subset(), but nicer!



