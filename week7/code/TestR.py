#!/usr/bin/env ipython3

"""This tests the subprocess running an Rscript through unix in python subprocess """

__appname__ = 'TestR.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'

##IMPORTS
import subprocess

subprocess.Popen("Rscript --verbose TestR.R >../results/TestR.Rout 2 >../results/TestR_errFile.Rout", shell=True).wait()

