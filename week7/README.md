# Week 7 Repository 

This contains all the coursework/practicals for week 7 of the CMEE course.

Specifically working on the first four topics in [The Multilingual Quantitative Biologist](https://mhasoba.github.io/TheMulQuaBio/intro.html) online book. 

1. [Biological computing in Python II](https://mhasoba.github.io/TheMulQuaBio/notebooks/06-Python_II.html)
2. [Introduction to Jupyter](https://mhasoba.github.io/TheMulQuaBio/notebooks/Appendix-JupyIntro.html)

## Languages
R version 3.6.2 (2019-12-12)
Python 3.10.8

## Dependencies 
Python: 
* numpy
* scipy
* scipy.integrate
* matplotlib.pylab
* subprocess
* timeit
* doctest

## Installation 
If you wish to run the scripts within the repository - you should clone the repository.
## Usage

[fmr.R](code/fmr.R)

The script is used as an example of subprocessing, it plots the relationship between metabolic rate and body mass. 

[LV1.py](code/LV1.py)

This script demonstratesnumerical intergration to solve the Lotka-Volterra model for predator-prey system. It outputs two figures as PDFs

[LV2.py](code/LV2.py)

This script demonstratesnumerical intergration to solve the Lotka-Volterra model for predator-prey system with density dependence. It outputs two figures as PDFs

[LVspeed.sh](code/LVspeed.sh)

This scripts profiles LV1.py and LV2.py using the %run -p approach. 

[myfirstjupyternb.ipynb](code/myfirstjupyternb.ipynb)

This is an example of a jupyter notebook, illustrating how jupyter can be used. 

[profileme.py](code/profileme.py)

This script demonstrates profiling in python. 

[profileme2.py](code/profileme2.py)

This script demonstrates improved profiling in python. 

[profileme3.py](code/profileme3.py)

This script is based on understand profiling, where improvements
are made using numpy arrays.

[run_fmr_R.py](code/run_fmr_R.py)

This script demonstates using subprocessing to generate fmr.R

[TestR.py](code/TestR.py)

This script tests the subprocess running an Rscript, TestR.R, through unix in python subprocess.

[TestR.R](code/TestR.R)

This script is to test verbose and subprocessing

### Groupwork 

[CompareSpeeds.sh](code/CompareSpeed.sh) 

This shell script compares the computational speed of the four vectorization scripts.

[Vectorize1.R](code/Vectorize1.R) and [Vectorize2.R](code/Vectorize2.R) 

These scripts are an example of vectorisation in R.

[Vectorize1.py](code/Vectorize1.py) and [Vectorize2.py](code/Vectorize2.py)

 These scripts implement Vectorize1.R and Vectorize2.R in python.
