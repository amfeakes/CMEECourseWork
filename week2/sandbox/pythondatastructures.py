#Lists
mylist = [3,2.44,'green',True]
mylist [1]
mylist [0]
mylist [4]
mylist[2] A= 'blue'
mylist
mylist.append('a new item')
type(mylist)
print(type(mylist))
mylist
del mylist[2]
mylist
#Tuples 
foodweb=[('a','b'),('a','c'),('b','c'),('c','c')]
foodweb
foodwe
b[0]
foodweb[0][0]
foodweb[0][0] = "bbb"
foodweb[0] = ("bbb","ccc")
foodweb[0]
foodweb

a = (1, 2, [])
a
a[2].append(1000)
a
a[2].append((100,10))
a
a = (1, 2, 3)
b = a + (4, 5, 6)
b
c = b[1:]
c
b = b[1:]
b
a = ("1", 2, True)
a
##sets
a = [5,6,7,7,7,8,9,9]
b = set(a)
b
c = set ([3,4,5,6])
b & c # intersection
b | c # union 

##dictionaries 
GenomeSize = {'Homo sapiens': 3200.0, 'Escherichia coli': 4.6, 'Arabidopsis thaliana': 157.0}Ge
GenomeSize
GenomeSize['Arabidopsis thaliana']
GenomeSize['Saccharomces cerevisiae'] = 12.1
GenomeSize
GenomeSize['Escherichia coli'] = 4.6
GenomeSize
GenomeSize['Homo sapiens'] = 3201.1
GenomeSize

#copying mutable objects 
a = [1, 2, 3]
b = a 

a.append(4)
print(a)
print(b)
b.append(5)
print(a)
print(b)

a = [1, 2, 3]
b = a[:]
a.append(4)
print(a)
print(b)

a = [[1, 2], [3, 4]]
b = a[:]
print(a)
print(b)
a [0] [1] = 22
print(a)
print(b)

import copy
a = [[1, 2], [3, 4]]
b = copy.deepcopy(a)
a[0] [1] = 22
print(a)
print(b)


#python with strings 

s = " this is a string "
len(s) # length of s -> 18
s.replace(" ","-") #substitue space with dashes
s.find("s") # first occruence starting at 0
s.count("s") # count the number of s 
t= s.split() #split the string uses spaces, make a list
t
t= s.split("is") #split the string using is 
t= s.strip () #remove trailing spaces
t
s.upper()
s.upper().strip()
'WORD'.lower()

#getting help 
?s.upper
or help()
