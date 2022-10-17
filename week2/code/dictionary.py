#!/usr/bin/env ipython3

__appname__ = 'dictionary.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

""" This script demonstrates creating a dictionary from a list of tuples and printing it."""

taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a python script to populate a dictionary called taxa_dic derived from
# taxa so that it maps order names to sets of taxa and prints it to screen.
#
#create empty dic, the forloop it, for each
# An example output is:
#  
# 'Chiroptera' : set(['Myotis lucifugus']) ... etc. OR, 'Chiroptera': {'Myotis
#  lucifugus'} ... etc

#### Your solution here ####

#first turn the taxa list into a dictionary
taxa_dictionary = dict(taxa)

taxa_dic={}

for key, value in taxa_dictionary.items():
    if value in taxa_dic:
        taxa_dic[value].append(key)
    else:
        taxa_dic[value] = [key]
print(taxa_dic)
print("Sorted by taxa:", str(taxa_dic))


# Now write a list comprehension that does the same (including the printing after the dictionary has been created)  
 
#### Your solution here #### 
