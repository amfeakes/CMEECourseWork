#!/usr/bin/env ipython3

"""This script shows the use of control statements, in a module form."""

__appname__ = 'cfexercises1.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.2'

# edits added to make it module like
# functions to take arguments from the user
# test arguements to show that they work

##imports##
import sys #module to interface out program with the operating system

def foo_1(x):
    """Raised input to the power of 0.5"""
    return x ** 0.5

def foo_2(x, y):
    """Requires two inputs, returns the greater value input """
    if x > y:
        return x
    return y

def foo_3(x, y, z):
    """Rearranges the inputs into acsending order(sometimes), using tmp"""
###If x is greater than y then they will switch, if y is greater than z then they will be switched, this is meant to order the numbers.
    if x > y:
        tmp = y
        y = x
        x = tmp
    if y > z:
        tmp = z
        z = y
        y = tmp
    return [x, y, z]

def foo_4(x):
    """Finds the factorial of the input """
    result = 1
    for i in range(1, x + 1):
        result = result * i
    return result

def foo_5(x): #
    """ A recursive function that calculates the factorial of x"""
    if x == 1:
        return 1
    return x * foo_5(x - 1)
     
def foo_6(x):
    """Calculate the factorial of x in a different way; no if statement involved"""
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto

##testing the arguments work 

## standard functions##
def main(argv):
    """Test all the arugments within the script, to output evaulations of the foo_x functions."""
    print(foo_1 (10))
    print(foo_2(11, 12))
    print(foo_3(15, 14, 13))
    print(foo_4(16))
    print(foo_5(17))
    print(foo_6(18))
    return 0

if (__name__ == "__main__"):
    status = main(sys.argv)
    sys.exit(status)