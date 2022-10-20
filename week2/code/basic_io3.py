#!/usr/bin/env ipython3

"""This script shows how to store files in python."""

__appname__ = 'basic_io3.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.2'

##Imports

import pickle

#############################
# STORING OBJECTS
#############################
# To save an object (even complex) for later use
my_dictionary = {"a key": 10, "another key": 11}

with open('../data/testp.p','wb') as f: ## note the b: accept binary files (read by machine)
    pickle.dump(my_dictionary, f) #stores the object inside the file testp.p
f.close()

## Load the data again
with open('../data/testp.p','rb') as f: # rb - permission to read the file, not change it
    another_dictionary = pickle.load(f) # data loaded into a new variable
f.close()

print(another_dictionary)
