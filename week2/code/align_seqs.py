#!/usr/bin/env ipython3

"""This script is used to align two DNA sequences in the
best possible way. It uses inputs from the data directory
and outputs a text file in the results directory."""

__appname__ = 'align_seqs.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

###IMPORTS###
import csv
import sys
#import os
###FUNCTIONS###

#######################
#this function reads in the csv from the data directory
#it then takes the contents and places it is seq file, taking each object and naming seqa and seqb
def read_csv():
    with open ("../data/sequences.csv", 'r') as seqfile:
        csvreader = csv.reader(seqfile)
        seqfile = [row[0] for row in csvreader]
    seqa, seqb = seqfile #implicit unpacking

    return seqa, seqb
##########################
#this function computes the score of the alignment
#using a for loop and the length of the sequences
def calculate_score(s1, s2, l1, l2, startpoint):
    """This computes the score """
    matched = "" # to hold string displaying alignements
    score = 0
    for i in range(l2):
        if (i + startpoint) < l1:
            if s1[i + startpoint] == s2[i]: # if the bases match
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"
    # some formatted output
    #print("." * startpoint + matched)
    #print("." * startpoint + s2)
    #print(s1)
    #print(score)
    #print(" ")

    return score
#############################
#this function takes the inputted sequences, calaculates their length
#it requires the first seqeneces to be longer than the second - if this is not already the case this will swap the sequences around
def assign(foo1,foo2):
    #os.rename(seq1, s1)
    #os.rename(seq2, s2)
    l1 = len(foo1)
    l2 = len(foo2)
    if l1 < l2:  # if l1 is less than l2, swap them around
        foo1, foo2 = foo2, foo1  # swap the two seqeuns
        l1, l2 = l2, l1  # swap the two lengths
    #print(foo1)
# now try to find the best match (highest score) for the two sequences
    return foo1, foo2, l1, l2

##############################
#this function calculates the best score and best alignment
#this function uses calculate_score function (already defined)
#uses a for loop with a range of the length of seq1
def calculate_best(s1, s2, l1, l2):
    best_a = None
    best_s = -1
    for i in range(l1): # Note that you just take the last alignment with the highest score
        z = calculate_score(s1, s2, l1, l2, i)
        if z > best_s:
            best_a = "." * i + s2 # think about what this is doing!
            best_s = z
    return best_a, best_s
    #
    #return best_a, best_s
#print(best_a)
#print(s1)
#print("Best score:", best_s)

# Test the function with some example starting points: just to understnad, will not be in final script
# calculate_score(s1, s2, l1, l2, 0)
# calculate_score(s1, s2, l1, l2, 1)
# calculate_score(s1, s2, l1, l2, 5)

###STANDARD FUNCTIONS###
def main(argv):
    #input
    seq1 , seq2 = read_csv() #returns a tuple and then implicit unpacking into seq 1/2
    #assigning seq
    s1, s2, l1, l2 = assign(seq1, seq2)
    #calculations
    best_a, best_s = calculate_best(s1, s2, l1, l2)
    #output
    output = open('../results/align_seqs_results.txt', 'w')
    output.write ("Best alignmment: " + str(best_a) + "\n" + "Best score: " + str(best_s) + "\n")
    return 0

if __name__ == "__main__":
    status = main(sys.argv)
    sys.exit(status)