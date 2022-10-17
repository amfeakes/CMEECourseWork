#!/usr/bin/bash

""" This exersixe  is based on writing list comprehensions and loops for a
 list of bird species (latin name, common name and mean body masses).
"""


birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 

latin_names = [b[0] for b in birds]
"""Latin names:"""
print(latin_names)

common_names = [b[1] for b in birds]
print(common_names)

mean_body_mass = [b[2] for b in birds]
print(mean_body_mass)

# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 



# A nice example out out is:
# Step #1:
# Latin names:
# ['Passerculus sandwichensis', 'Delichon urbica', 'Junco phaeonotus', 'Junco hyemalis', 'Tachycineata bicolor']
# ... etc.
 
