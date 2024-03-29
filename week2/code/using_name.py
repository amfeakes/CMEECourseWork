#!/usr/bin/env ipython3

"""This script illustrates if __name__= __main__ function."""

__appname__ = 'using_name.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'


if __name__ == '__main__':
    print('This program is being run by itself')
else:
    print('I am being imported from another module')

print("This module's name is : " + __name__)