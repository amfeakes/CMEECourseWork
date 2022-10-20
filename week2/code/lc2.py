#!/usr/bin/env ipython3

""" This exercise  is based on writing list comprehensions and loops for a
 month and rainfall tuples ."""

__appname__ = 'lc2.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.

# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !).
##Using list comprehensions
print("Using list comprehensions")
#takes the second value [1] in each i of rainfall to see if it is over 100, if it is it prints all of i in a list
greater_lc = [i for i in rainfall if i[1] > 100]
print("Months and rainfall values when the amount of rain was greater than 100mm:" + "\n",greater_lc)

less_lc = [i[0] for i in rainfall if i[1] < 50 ]
print("Months when then amount of rainfall was less than 50mm:"+ "\n",less_lc)

##Using loops
print("\n" + "Using loops")
#creates an empty space
greater_loop = []
#labels each part of the list above
for i in rainfall:
    #takes [1] of the list to see if the value os greater than 100
    if i[1] > 100:
        #if value is it will add to the list
        greater_loop.append(i)
print("Months and rainfall values when the amount of rain was greater than 100mm:"+ "\n",greater_loop)

less_loop = []
for i in rainfall:
    if i[1] < 50:
        # if the value is less than 50 it takes only the first part of i and adds it to the less_loop
        less_loop.append(i[0])
print("Months when then amount of rainfall was less than 50mm:"+ "\n",less_loop)

