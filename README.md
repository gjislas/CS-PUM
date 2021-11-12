# CS-PUM
Software for the cubbed sphere partition of unity method.

By Genesis J. Islas

The work found here is the software the spectral cubed sphere method and a select set of numerical experiments completed for my dissertation in support of my PhD degree in applied mathematics at Arizona State University.

The folder "experiments" contains sample code which computes the convernce results for a select set of functions and the numerical solutiong for the diffusino equation on the surface of the sphere. 
Details of this method can be found in Chapters 2 of my dissertation.

##########################################################

Dependencies:

The following libraries are needed:

FINUFFT (https://finufft.readthedocs.io/en/latest/index.html)
FFTW3 (https://www.fftw.org/)

##########################################################

Instructions:
Simply run your experiment choice in MATLAB

The code will produce the following files:

For "Func_App_Err_Converg.m"
1. Plots of the functions being approximated
2. Error convergence plot for each function

For "DiffusionEquation.m"
1. Plot of the exact solution at the final time
2. Plot of the approximation at the final time
3. Plot of the error at the final time 
