#!/usr/bin/env ipython3

"""This script shows examples of variable scope."""

__appname__ = 'scope.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'
############
_a_global = 10 #a global variable - outside of a function

if _a_global >= 5:
    _b_global = _a_global + 5 #also a global variable 
print("Before calling a_fuction, outside the function, the value of _a_global is", _a_global)
print("Before calling a_function, outside the function, the value of _b_global is", _b_global)

def a_function():
    _a_global = 4 #a local variable  - as function is named this value has been changed ONLY inside the function

    if _a_global >= 4:
        _b_global = _a_global + 5 #also a local variable - updated inside the fucntion

    _a_local = 3
    #this is in the function - so will only exist inside, not outside
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value of _b_global is", _b_global)
    print("Inside the function, the value of _a_local is", _a_local)

a_function()

print("After calling a_function, outside the function, the value of _a_global is (still)", _a_global)
print("After calling a_function, outside the function, the value of _a_global is (still)", _b_global)
print("After calling a_function, outside the function, the value of _a_local is ", _a_local)
#this is not possible, creates an error
#why - because a local is only defined within the function
###########################################################

_a_global = 10

def a_function():
    _a_local = 4

    print("Inside the function, the value _a_local is", _a_local)
    print("Inside the function, the value of _a_global is", _a_global)
a_function()

print("Outside the function, the value of _a_global is", _a_global)

###############

_a_global = 10

print("Before calling a_function, outside the function, the value of _a_global is", _a_global)

def a_function():
    global _a_global
    _a_global = 5 #outside the function
    _a_local = 4 #in the function

    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the vaule of _a_local is", _a_local)
a_function()

print("After calling a_function, outside the function, the value of _a_global now is", _a_global)
#####################
def a_function():
    _a_global = 10

    def _a_function2():
        global _a_global
        _a_global = 20
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()

    print("After calling a_function2, value of _a_global is", _a_global)
a_function()

print("The value of a_global in main workspace / namespace now is", _a_global)
###########################

_a_global = 10

def a_function():
    def _a_function2():
        global _a_global
        _a_global = 20
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()

    print("After calling a_function2, value of _a_global is", _a_global)

a_function()

print("The value of a_global in main workspace / namespace now is", _a_global)
#####################