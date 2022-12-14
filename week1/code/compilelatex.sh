#!/bin/bash
#Author: Amy Feakes amy.feakes222@imperial.ac.uk
#Script: compilelatex.sh
#Desc: shell script to compile .tex with .bib and clean up and provide a single .pdf
#Arguments:  1 - .tex file 
#Date: Oct 2022


#removing the .tex file extension
NAME=`basename -s .tex $1` 

#check that the input is valid 
if [ -z "$NAME" ]
then 
    echo "Input a .tex file"
    exit 0
fi

#compiling the file
 echo "Compiling .pdf, including bibliography"
    pdflatex $NAME
    bibtex $NAME
    pdflatex $NAME
    pdflatex $NAME
   
# moving the output 
 mv $NAME.pdf ../results

 #this line of code is limited to mac
 open -a "Preview" ../results/$NAME.pdf &

## Cleanup
   # [ -e *.aux ] && rm *.aux
    #[ -e *.log ] && rm *.log
    #[ -e *.bbl ] && rm *.bbl
    #[ -e *.blg ] && rm *.blg

# clean up 
    rm *.aux
    rm *.log
    rm *.bbl
    rm *.blg
    
exit

#still one issue Transcript written on firstexample.log. ? 