
birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
        )


# Birds is a tuple of tuples of length three: latin name, common name, mass.
# write a (short) script to print these on a separate line or output block by species 
# 
# A nice example output is:
# 
# Latin name: Passerculus sandwichensis
# Common name: Savannah sparrow
# Mass: 18.7
# ... etc.

# Hints: use the "print" command! You can use list comprehensions!

# Finds just those taxa that are oak trees form a list of

taxa = [ 'Quercus robur',
         'Fraxinus excelsior'
         'Pinus sylvestris'
         'Quercus cerris'
         'Quercus petraea'
         ]
def is_an_oak(name):
    return name.lower().startswith('quercus ')

#using for loops
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species)
print(oaks_loops)

#using list comprehensions
oaks_lc = set([species for species in taxa if is_an_oak(species)])
print(oaks_lc)

#get names in uppercase using for loops
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species.upper())
print(oaks_loops)

#get names in uppercase using for list comprehensions
oaks_lc = set([species.upper() for species in taxa if is_an_oak(species)])
print(oaks_lc)