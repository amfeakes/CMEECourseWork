#!/usr/bin/env ipython3

"""This script is an example of a function which has a bug """

__appname__ = 'debugme.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

def buggyfunc(x):
    """This function is set up to find a bug using pdb"""
    y = x
    for i in range(x):
        y = y-1
        z = x / y
        #  import pdb; pdb.set_trace() ##this is a breakpoint
        except ZeroDivisionError:
            print(f"The result of dividing a number by zero is undefined")
        except:
            print(f"This didn't work;{x = }; {y = }")
        else:
            print(f"OK; {x = }; {y = }, {z = };")
    return z

buggyfunc(20)