# Fixed Point Iteration
This function calculates the root approximation of a function using the fixed-point iteration method
## Inputs
* func: the function used to calculate the root
* x: the initial guess of the root
* es: the stopping criterion (if omitted, defaults to .00001 percent)
* maxit: the maximum iterations to perform (if omitted, defaults to 200 iterations)
## Outputs
* root: the root approximation
* fx: the function value at the root
* ea: the relative approximate error
* iter: the number of iterations performed to reach these values
