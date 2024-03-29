#!/usr/bin/env ipython3

"""This script shows how to  print information from nester tuples."""

__appname__ = 'tuple.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
        )

# Birds is a tuple of tuples of length three: latin name, common name, mass.
# write a (short) script to print these on a separate line or output block by
# species 
# 
# A nice example output is:
# 
# Latin name: Passerculus sandwichensis Common name: Savannah sparrow Mass: 18.7
# ... etc.

#for loop, where a is an iterate in the birds list, [] refer to each part of the list
print("Method 1")
for a in birds:
    print("Latin name:", a[0])
    print("Common name:", a[1])
    print("Mean body mass", a[2],'\n')

##try to code in only 2 lines, where (x, y, z ) refer to each part of the list
print("Method 2")
for (x,y,z) in birds:
    print("Latin name:", x , "Common name:", y , "Mass" , z , "\n")