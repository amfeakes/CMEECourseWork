#!/usr/bin/env ipython3

"""Some functions exemplifying the use of control statements"""
#docstrings are considered part of the running code (normal comments are #stripped). 
#Hence, you can access your docstrings at run time

__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

##imports##
import sys #module to interface out program with the operating system 
import doctest #import the doc test module

def even_or_odd(x=0): #if not specificed, x should take the valuo 0 
    """Fine whether a number x is odd or even

    >>> even_or_odd(10)
    '10 is Even'

    >>> even_or_odd(5)
    '5 is Odd'

    in case of negative numbers, the positive is taken:
    >>> even_or_odd(-2)
    '-2 is Even'
  """
    if x % 2 == 0: #this is the conditional if
        return f"{x} is Even"
    return f"{x} is Odd"



## standard functions##
def main(argv):
    print(even_or_odd (22))
    print(even_or_odd (33))
    return 0 

if (__name__ == "__main__"):
    status = main(sys.argv)

doctest.testmod()


