# The Computing Miniproject 

This repository contains all the material to run my miniproject report. 

Specifically working on the task set in  in [The Multilingual Quantitative Biologist](https://mhasoba.github.io/TheMulQuaBio/notebooks/Appendix-MiniProj.html) online book. 

## Installation 

If you wish to run the scripts within the repository - you should clone the repository

## Languages

R version 4.2.2

bash version 3.2.57(1)

## Dependencies 

**R** 
* tidyverse to manipulate dataframes 

* ggplot2 for visualisation

* dplyr to manipulate dataframes 

* minpack.lm to fit non-linear models

* ggpubr to arrange multiple plots

**LaTeX**

* inputenc to input encodings

* geometry to set the page size and margins

* setspace to set the spacing between lines 

* amsmath to aid typesetting mathematical statements

* gensymb to provide generic symbols

* graphicx to input graphics 

* hyperref to handle cross-referencing

* parskip to enhance paragraph layout



## Usage 

Navigate to the code directory within this repository, then use bash to execute the script [run_miniproject.sh](code/run_miniproject.sh). This will run through the remaining scripts within the code directory.

**Script descriptions**

[run_miniproject.sh](code/run_miniproject.sh) This script is run from the bash terminal and encorporates all the scripts below to run the whole project through.

[script_1.R](code/script_1.R) This script contains the data wrangling section of the project.

[script_2.R](code/run_miniproject.sh) This script fits models, and then carries out plotting and anaylsis.

[miniproject_report.tex](code/miniproject_report.tex) This script is the write up.

[miniproject_report.bib](code/miniproject_report.bib) This contains the bibliogrpahy for the write up.

[compilelatex.sh](code/compilelatex.sh) This script sits within the overall shell script to compile the tex and bib file to create the report. 

