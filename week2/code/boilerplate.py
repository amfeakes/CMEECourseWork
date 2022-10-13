#!/usr/bin/env ipython3

"""Description of this program or application.
You can use several lines"""

__appname__ = '[application name here]'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"

##imports##
import sys #module to interface out program with the operating system 

##constants##

##functions##
def main(argv):
    """Main entry point of the program"""
    print('This is a boilerplate') #note: indented using two tabs
    return 0 

if __name__ == "__main__":
    """Make sure the "main" function is called from command line"""
    status = main(sys.argv)
    sys.exit(status)



