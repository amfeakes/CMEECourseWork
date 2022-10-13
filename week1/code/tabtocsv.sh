#!/bin/sh
#Author: Amy Feakes amy.feakes222@imperial.ac.uk
#Script: tabtocsv.sh
#Description substitue the tabs in the files with commas, saves the output into a .csv file
# Arguments: 1 -> tab delimited file 
# Date: Oct 2022

if [[ "$1" == *".txt"* ]] ;
    then
        echo "Creating a comma delimited version of $1 ..."
        sed 's/ /,/g' $1 >> ../results/`basename -s .txt $1`.csv
        echo "Done!!"
    else 
        echo "Input places is not .txt"
fi
