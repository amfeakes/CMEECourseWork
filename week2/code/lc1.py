#!/usr/bin/env ipython3

""" This exercise  is based on writing list comprehensions and loops for a
 list of bird species (latin name, common name and mean body masses)."""
__appname__ = 'lc1.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 
print("Using list comprehensions")
## b refers to each row in birds, [0] takes the first column of the row
latin_names = [b[0] for b in birds]
print("Latin names", latin_names)

common_names = [b[1] for b in birds]
print("Common names", common_names)

mean_body_mass = [b[2] for b in birds]
print("Mean body mass", mean_body_mass)

# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 
print("\n" + "Using loops")
#first creates an empty space to create the new variable
latin_names_loop = []
#iterate over a list
for i in birds:
#this allows the first value in i to be added, on a loop
    latin_names_loop.append(i[0])
#prints the placeholder with the information taken from birds
print("Latin names", latin_names_loop)

common_names_loop = []
for i in birds:
    common_names_loop.append(i[1])
print("Common names", common_names_loop)

mean_body_mass_loop = []
for i in birds:
    mean_body_mass_loop.append(i[2])
print("Mean body mass", mean_body_mass_loop)