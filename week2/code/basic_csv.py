#!/usr/bin/env ipython3

"""This script demonstrates working with csv's in python."""

__appname__ = 'basic_csv.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

import csv

# Read a file containing:
# 'Species','Infraorder','Family','Distribution','Body mass male (Kg)'
with open('../data/testcsv.csv','r') as f: #opens read only file

    csvread = csv.reader(f) #new variable
    temp = [] #new list
    for row in csvread: #creates a loop
        temp.append(tuple(row)) #changes to tupules, these are added to the temp list
        print(row)
        print("The species is", row[0])

# write a file containing only species name and Body mass
with open('../data/testcsv.csv','r') as f:
    with open('../data/bodymass.csv','w') as g: #creates and writes a new file for the new information

        csvread = csv.reader(f) #reads testcsv
        csvwrite = csv.writer(g) #writes in bodymass.csv
        for row in csvread: #loop
            print(row)
            csvwrite.writerow([row[0], row[4]]) # 0 (first row) and 4 (fith row) written into the new file
