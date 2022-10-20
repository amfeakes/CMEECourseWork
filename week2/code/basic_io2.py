#!/usr/bin/env ipython3

"""This script shows how to output files in Python."""

__appname__ = 'basic_io2.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.2'


############
#FILE OUTPUT
#############
# Save the elements of a list to a file
list_to_save = range(100) #creates a list from 0 - 99 (remember python bounds)

with open('../results/testout.txt','w') as f:
    for i in list_to_save:
        f.write(str(i) + '\n') ## Add a new line at the end

f.close()