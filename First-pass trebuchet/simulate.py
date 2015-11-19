import scipy.integrate
from matplotlib.pyplot import *
from math import *
import numpy as np

import parameters as p

def flows(t, Y):

    pos = np.array(Y[0:2])
    vel = np.array(Y[2:4])
    
    gravity = -p.g*np.array([0, 1])
    spring = -p.k*(np.linalg.norm(pos) - p.l0)*(pos / np.linalg.norm(pos));
    acceleration = gravity + spring;

#    print Y, pos, vel
    return np.concatenate((vel, acceleration))
    

def main():
    # Code modified from http://docs.scipy.org/doc/scipy-0.16.0/reference/generated/scipy.integrate.ode.html
    # Start by specifying the integrator:
    # use ``vode`` with "backward differentiation formula"
    solver = scipy.integrate.ode(flows).set_integrator('vode', method='bdf')
    
    y0 = [2, 1, 0, 0]
    
    simduration = 800
    
    solver.set_initial_value(y0, 0)
    
    Times = []
    Y = []
    while solver.successful() and solver.t < simduration:
        solver.integrate(simduration, step=True)
        Times.append(solver.t)
        Y.append(solver.y)
        
        
    Ys = np.array(Y)
    plot(Ys[:,0], Ys[:,1])
    show()
    return Times, Ys