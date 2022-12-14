#!/usr/bin/env ipython3

"""Example script"""

__appname__ = 'myexamplescript.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

#example python script

#the function
def foo(x):
    """This function calculates the square of the inputted variable"""
    print("The square of the inputted variable")
    x *= x #same as x = x*x
    print(x)

#code/value
foo(2)
