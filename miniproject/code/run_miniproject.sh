#!/bin/bash
#Author: Amy Feakes amy.feakes222@imperial.ac.uk
#Script: run_miniproject.sh
#Desc: shell script to run the miniproject through data wrangling, anaylsis, plotting and compiling the report
#Arguments: 
#Date: Nov 2022

#data wranling 
echo "Carrying out the data wrangling ..."
Rscript script_1.R
echo "Completed"

#model fitting and comparison
echo "Fitting the models, carrying out model comparison and plotting them.."
Rscript script_2.R
echo "Completed"

#word count 
texcount -1 -sum=1,2 miniproject_report.tex > document.sum 

#compiling report 
/bin/bash compilelatex.sh miniproject_report.tex

exit
