# Week 1 Repository 

This contains all the coursework/practicals for week 1 of the CMEE course.

Specifically working on the first four topics in [The Multilingual Quantitative Biologist](https://mhasoba.github.io/TheMulQuaBio/intro.html) online book. 
1. [UNIX and Linux](https://mhasoba.github.io/TheMulQuaBio/notebooks/01-Unix.html)
2. [Shell scripting](https://mhasoba.github.io/TheMulQuaBio/notebooks/02-ShellScripting.html)
3. [Version control with Git](https://mhasoba.github.io/TheMulQuaBio/notebooks/03-Git.html)
4. [Scientific documents with LaTeX](https://mhasoba.github.io/TheMulQuaBio/notebooks/04-LaTeX.html)

## Installation 

If you wish to run the scripts within the repository - you should clone the repository

## Usage

### 1. UNIX and Linux

[unixprac1.txt](code/unixprac1.txt)

This file contains five commands (in UNIX shell), that analyse sequence data from FASTA files. Each line needs to be run separately to generate the output. 


### 2. Shell scripting 

[boilerplate.sh](code/boilerplate.sh)

This is a simple biolerplate for shell scripts, which prints 'This is a shell script!'.

[myexamplescript.sh](code/myexamplescript.sh)

This script demonstrates assiging values. 

[variable.sh](code/variable.sh)

This script illustrates different types of shell variables. Requiring only strings and numerical arguments. 

[tabtocsv.sh](code/tabtocsv.sh)

This script subsitutes the tabs in a file to commas. The output is saved in results as a .csv. 

[csvtospace.sh](code/csvtospace.sh)

This script uses a .csv file and converts it to a file which separetes the commans to spaces. It requires one file as the argument, and the output is placed in the results directory. 

[countlines.sh](code/countlines.sh)

This script counts the number of lines in a file, requiring one file as the argument. 

[tif2png.sh](code/tif2png.sh)

The script is to convert a .tif file to a .png file. 

[concatenatetwofiles.sh](code/concatenatetwofiles.sh)

This script concatenates the contents of two files, then places the output into the results directory. It requires two files to operate. 


### 3. Version control with Git

No code files were made in this section of the practical.


### 4. Scientific documents with LaTeX

[compilelatex.sh](code/compilelatex.sh)
This script combines LaTeX with Bibtex, it requires one LaTeX file to complete. The output is saved in the results directory and opened in preview (for Mac OS).

[firstbiblio.bib](code/firstbiblio.bib)
This is the BibTex reference for the LaTeX document firstexample.tex.

[firstexample.tex](code/firstexample.tex)
This is the LaTeX code to draft a simple document. 