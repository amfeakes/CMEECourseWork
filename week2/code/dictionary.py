#!/usr/bin/env ipython3

""" This script demonstrates creating a dictionary using list comprehensions and loops,
from a list of tuples."""

__appname__ = 'dictionary.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

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
# 'Chiroptera' : set(['Myotis lucifugus']) ... etc. OR, 'Chiroptera': {'Myotis
#  lucifugus'} ... etc

#### Your solution here ####
#first turn the taxa list into a dictionary
taxa_dictionary = dict(taxa)
#create a new empty space for key- value dictiornary
taxa_dic={}
#for each taxa (key) find the value
for a, b in taxa_dictionary.items():
# if the value is within the taxa then add
    if b in taxa_dic:
        taxa_dic[b].append(a)
    else:
        taxa_dic[b] = [a]
#print the new dic
print("\n" + "Sorted by taxa, using loops:", taxa_dic)

# Now write a list comprehension that does the same (including the printing after the dictionary has been created)
#### Your solution here #### 

#this first section takes the second part of each item in the list, moves it into a list for taxa
###taxa_dic_lc = {x[1]: [] for x in taxa}###
#this part takes the species name from taxa and if the taxa attached to that name is equal to that
# set in the groups above it adds it to the list
###set([y for y in taxa if y[1] == x[1]]###

taxa_dic_lc = {x[1]: set([y[0] for y in taxa if y[1] == x[1]]) for x in taxa}
print("\n" + "Sorted by taxa, using list comprehensions:", taxa_dic_lc)