# Modified Secant Method
This function calculates the root approximation of a function using the Modified Secant method
## Inputs
* func: the function used to calculate the root
* x_1: the initial guess of the root
* delta: fractional perterbation of the independant variable (if omitted, defaults to .000001)
* es: the stopping criterion (if omitted, defaults to .00001 percent)
* maxit: the maximum iterations to perform (if omitted, defaults to 200 iterations)
## Outputs
* root: the root approximation
* fx: the function value at the root
* ea: the relative approximate error
* iter: the number of iterations performed to reach these values
