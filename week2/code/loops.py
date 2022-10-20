#!/usr/bin/env ipython3

"""This script shows examples of for loops and WHILE loop."""

__appname__ = 'loops.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

#for loops - precise loop structure, entry control statement
#while loops - the number of interations is unknown and the statement will run until the condition is proved false

#for loops
for i in range(5): # from 0-4 due to python indexing
    print(i)
print("\n")
my_list = [0, 2, "geronimo!", 3.0, True, False]
for k in my_list:
    print(k)
print("\n")

total = 0
summands = [0, 1, 11, 111, 1111]
for s in summands: # s is each item in the list
    total = total + s # adds 0 +1 and prints, then the result + 11 then prints etc
    print(total)
print("\n")

#WHILE loop
z = 0
while z < 100: #while - it will contiune going - the number of iterations are unknown
    z = z + 1
    print (z)

    