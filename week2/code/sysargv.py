#!/usr/bin/env iphython3

"""This script demonstrates sys.argv."""

__appname__ = 'sysargv.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

#Imports
import sys
#Script
print("This is the name of the script:", sys.argv[0])
print("Number of arguemnts: ", len(sys.argv))
print("The arugments are:", str(sys.argv))