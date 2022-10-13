#!/bin/bash
#Author: Amy Feakes amy.feakes222@imperial.ac.uk
#Script: csvtospace.sh
#Description substitue the commas in the files with spaces, saves the output into a .txt file
# Arguments: 1 -> tab delimited file 
# Date: Oct 2022

if [[ "$1" == *".csv"* ]] ;
    then
        echo "Creating a tab delimited version of $1"
        sed 's/,/ /g' $1 >> ../results/`basename -s .csv $1`.txt   
        echo "Done!!"
    else   
        echo "Input not in .csv format"
fi

