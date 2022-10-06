#bin/sh
#Author: Amy Feakes amy.feakes222@imperial.ac.uk
#Script: unixprace1.sh
#Desc: fasta exercise with UNIX shell commands 
#Arguments: ? 
#Date: Oct 2022

# 1 count lines within files 
NumLines=`wc -l < $1`
echo "The file $1 has $NumLines lines"
echo

# 2 print everything from the second line of the e.coli genome 
tail -n +2
echo

grep 


# 3 count the sequence length of this genome 


# 4 count the matches of ATGC sequence


# 5 computer the AT/GC ratio 