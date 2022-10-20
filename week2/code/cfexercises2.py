#!/usr/bin/env ipython3

"""This script shows the use of loops and if (conditionals)."""

__appname__ = 'cfexercises2.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

#########
print("hello_1 - prints hello for each number in the range if it is a mulitple of three.")
def hello_1(x):
    for j in range(x):
        if j % 3 == 0:
            print('hello')
        print(' ')
hello_1(12)
#prints four times (0,3,6,9)
#########
print("hello_2 - prints hello if the number in the range has a remainder of 3 when divided between 5 or 4 ")
def hello_2(x):
    for j in range(x):
        if j % 5 == 3:
            print('hello')
        elif j % 4 == 3:
            print("hello")
        print(' ')

hello_2(12)
#prints at 3, 7, 8, 11 - four times
#########
print("hello_3 - prints the number of numbers between the range x,y.")
def hello_3(x, y):
    for i in range(x, y):
        print('hello')
    print(' ')

hello_3(3, 17)
#prints 14 times 3-16 = 14
########
print("hello_4 - prints hello for every x + 3 until 15 is reached")
def hello_4(x):
    while x != 15:
        print('hello')
        x = x + 3
    print(' ')

hello_4(0)
#prints at 0, 3, 6, 9, 12, 5 times
########
print("hello_5 - prints hello at the given numbers, going through a loop from x given to <100. ")
def hello_5(x):
    while x < 100:
        if x == 31:
            for k in range(7):
                print('hello')
        elif x == 18:
            print('hello')
        x = x + 1
    print(' ')
#x goes through each time, increasing, so when it hits 18 it prints hello, then again at 31,
hello_5(12)
#print 8 times?
#WHILE loop with Break
print("hello_6, print hello if x is true, and for each y value until 6 is reached. ")
def hello_6(x, y):
    while x: #while x is True
        print("hello!" + str(y))
        y += 1 # increment y by 1
        if y == 6:
            break
    print(' ')

hello_6 (True, 0)
#prints 6 times hello!0-5