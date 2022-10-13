#!/bin/bash
#Author: Amy Feakes amy.feakes222@imperial.ac.uk
#Script: tif2png.sh
#Desc: convert a .tif to .png
#Arguments:  1 - .tif file 
#Date: Oct 2022

#check correct file has been provided 
if [[ $1 == *.tif ]]

#convert the file, then move the file to results, under .png
then 
        echo "Converting $1"
        convert "$1" "$(basename "$1" .tif).png" 
        echo "File converted and placed in results "
        mv "$(basename "$1" .tif).png"  ../results

#if incorrect file extension has been provided, print message asking for correct file 
else
    echo "Please enter a .tif file"
    exit
fi