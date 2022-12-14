#!/usr/bin/env ipython3

"""This script uses subprocess to run a R script."""

__appname__ = 'run_fmr_R.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

##IMPORTS
import subprocess
import sys

def main(argv):
    """Running subproccesing"""
    p = subprocess.Popen("Rscript --verbose fmr.R", shell=True).wait()
    if p == 0:
        print("Ran sucessfully")
    else:
        print("Run was not sucessful")
    return 0

if __name__ == "__main__":
    status = main(sys.argv)
    sys.exit(status)
