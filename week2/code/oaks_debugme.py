#!/usr/bin/env ipython3

"""This script is an exercise to practise using debugging and ipdb."""

__appname__ = 'oaks_debugme.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

##Imports
import csv
import sys
import doctest

#Define function
def is_an_oak(name):
    """ Returns True if name is starts with 'quercus'
    >>> is_an_oak('Quercus ')
    True

    >>> is_an_oak('Betula ')
    False

    >>> is_an_oak('Populus ')
    False
    """
    return name.lower().startswith('quercus ') #quercus space as space is part of the string

def main(argv):
    """This is the main argument, running the data"""
    f = open('../data/TestOaksData.csv','r')
    g = open('../data/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]+" "): #add a space so it matches
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]])    

    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)

doctest.testmod()   # To run with embedded tests