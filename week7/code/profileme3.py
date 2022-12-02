#!/usr/bin/env ipython3

"""This script is based on understand profiling, where improvements have converted a loop to a
list compreheension. ."""

__appname__ = 'profileme2.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

##IMPORTS
import sys


def my_squares(iters):
    out = [i ** 2 for i in range(iters)]
    return out

def my_join(iters, string):
    out = ''
    for i in range(iters):
        out += ", " + string
    return out

def run_my_funcs(x,y):
    print(x,y)
    my_squares(x)
    my_join(x,y)
    return 0


def main(argv):
    return run_my_funcs(10000000, "My string")

if __name__ == "__main__":
    status = main(sys.argv)
