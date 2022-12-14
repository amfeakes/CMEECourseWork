#!/usr/bin/env ipython3

"""This script works to do numerical intergration to solve the Lotka-Volterra model
  for predator-prey system."""

__appname__ = 'LV2.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'


###IMPORTS###
import numpy as np
import scipy.integrate as intergrate
import matplotlib.pylab as p
import sys


##CONSTANTS###
#define the time vector
t = np.linspace(0, 15, 1000) #arbitary units of time
#setting the inital conditions for the two populations
R0 = 10
C0 = 5
RC0 = np.array([R0, C0])


###FUNCTIONS####

#defina a function, intialise the populations with R and C
def dCR_dt(pops, t, r, a, z, e, K):
    """This inialises the population"""
    R = pops[0]
    C = pops [1]
    dRdt = r * R*(1 - (R/K)) - a * R * C
    dCdt = -z * C + e * a * R * C

    return np.array([dRdt, dCdt])

type(dCR_dt)

def plot_graphs(pops):
    """This function visualises the results."""
    ##Visualise the results
    f1 = p.figure()
    p.plot(t, pops[:, 0], 'g-', label='Resource density')  # plot
    p.plot(t, pops[:, 1], 'b-', label='Consumer density')  #
    p.grid()
    p.legend(loc='best')
    p.xlabel('Time')
    p.ylabel('Population density')
    p.title('Consumer-Resource population dynamics')
    # p.show() #to display
    # generate the second figure
    f2 = p.figure()
    p.plot(pops[:, 0], pops[:, 1], 'r-')
    p.grid()
    p.xlabel('Resource density')
    p.ylabel('Consumer density')
    p.title('Consumer-Resource population dynamics')
    # p.show() #to display
    return(f1, f2)

def main(argv):
    try: #this checks the correct number are provided and assigns them
        r, a, z, e, K = argv[1:]
    except ValueError:
        print(f"Incorrect number of arguments provided ({len(argv[1:])}/5)")
        print(argv[1:])
    #return
    r,a,z,e,K = np.array([r,a,z,e,K], dtype=float)
    # r, a, z, e, K = float(r, a, z , e, K)
    #numericallying intergrate the system from the starting conditions
    pops = intergrate.odeint(dCR_dt, RC0, t, args=(r, a, z, e, K), full_output=False)
    pops #contains the result (the population trajectories)
    # type(infodict)
    # infodict.keys()
    # infodict['message'] #to check output
    f1, f2 = plot_graphs(pops)
    f2.savefig('../results/LV2_model3.pdf')  # save figure
    f1.savefig('../results/LV2_model4.pdf')  # save figure

if __name__ == "__main__":
    status = main(sys.argv)
