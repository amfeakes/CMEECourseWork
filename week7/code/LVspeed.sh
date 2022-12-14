#!/bin/sh

#Author: Amy Feakes amy.feakes222@imperial.ac.uk
#Script: LVspeed.sh
#Desc: runs the LV1 and LV2 script with profiling
#Arguments: LV1, LV2
#Date: Oct 2022

echo  "Profiling LV1.py"
ipython -m cProfile LV1.py
echo  "Profiling LV2.py taking 5 arguements (1, 0.1, 1.5, 0.75, 100)"
ipython3 -m cProfile LV2.py  1 .1 1.5 .75 100
