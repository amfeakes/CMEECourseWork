#!/usr/bin/env ipython3

"""This script inputs files into python."""

__appname__ = 'basio_io1.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.2'

#########
# FILE INPUT
##############
# Open a file for reading 
with open('../data/test.txt', 'r') as f:
# use "implicit" for loop:
# if the object is a file, python will cycle over lines 
    for line in f:
      print(line) #prints each line

f.close() #closes file

# Same example, skip blank lines 
with open('../data/test.txt', 'r') as f:
    for line in f:
     if len(line.strip()) > 0: #checks to see if the line is empty, strip removes spaces (before or after)
         print(line)

f.close()