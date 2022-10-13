#!/bin/bash
#Author: Amy Feakes amy.feakes222@imperial.ac.uk
#Script: countlines.sh
#Desc: count the number of lines in a file 
#Arguments: 1 - file with lines  
#Date: Oct 2022

echo "Counting number of lines in $1"

#check the input 
if [ -z "$1" ]
then    
    echo "Please enter file"
    exit    
fi

#count the number of lines 
NumLines=`wc -l < $1`
echo "The file $1 has$NumLines lines"
exit