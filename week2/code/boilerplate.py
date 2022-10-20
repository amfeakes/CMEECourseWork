#!/usr/bin/env ipython3
#this is the shebang line - tells the computer where the app is - in this case python

"""Description of this program or application.
You can use several lines"""
#docstring - describes what the script does, tells the user how to use the code

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
    print('This is a boilerplate')
    return 0 
# this is the main function. if the script is run alone it will get its arguments from below
# if the script has been imported  the arguments are obtained from that imported script

if __name__ == "__main__":
    """Make sure the "main" function is called from command line"""

    status = main(sys.argv)
    sys.exit(status)
# this section is to allow the code to be reusable
# the code below if __name___ = will run if this is run by itself
# otherwise __name__ is set to the inputted file

#status - sets the command that is being run as a variable
#sys.argv - this contains the names of all the arguments in the script


#notes from Q and A on these two standard functions
#argv is a list - of all the arugments (can contain a mixture of things
#
# if section it tells the python iteperter that this scrupt is programmes to be run by itself
    #passes control to whatever function is there

