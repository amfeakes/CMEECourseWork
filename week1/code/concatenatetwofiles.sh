#!/bin/bash
#Author: Amy Feakes amy.feakes222@imperial.ac.uk
#Script: concatenatetwofiles.sh
#Desc: combining two files into one file
#Arguments: 2 - two files to merge
#Date: Oct 2022

#check for valid inputs, if not then print error 

if [ -z "$1" ] || [ -z "$2" ]
then    
    echo "Error. Please enter two file names"
    exit 
fi

#then, if two files are provided, concatonte 

cat $1 > mergedfile.sh
cat $2 >> mergedfile.sh

#save this file in results 
mv mergedfile.sh  ../results/$3

# feedback 
    echo "Merged file is saved in results as mergedfile"

#if you want to show merged file 
    # cat ../results/merged
