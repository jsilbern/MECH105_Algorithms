function [root, fx, ea, iter] = NEWTONRAPHSON(func, dfunc, x, es, maxit)
%NEWTONRAPHSON: This function calculates the root approximation of a function
%   using the Newton-Raphson method
%   Inputs:
%       func: the function used to calculate the root
%       dfunc: the function's derivative
%       x: the initial guess of the root
%       es: the stopping criterion
%           if omitted, defaults to .00001 percent
%       maxit: the maximum iterations to perform
%           if omitted, defaults to 200 iterations
%   Outputs:
%       root: the root approximation
%       fx: the function value at the root
%       ea: the relative approximate error
%       iter: the number of iterations performed to reach these values

switch nargin
    case 0
        error('must have at least three inputs')
    case 1
        error('must have a derivative function')
    case 2
        error('must have initial guess')
    case 3
        es = 0.00001;
        maxit = 200;
    case 4
        maxit = 200;
end

% Make sure bounds are scalars
if length(x) ~= 1
    error('initial guess must be a scalar value')
end

% Initiate variables
ea = 100;
iter = 0;
xrold = x;

% Check if guesses are the root
if func(x) == 0
    xr = x;
    ea = 0;
end

% Consult Algebrator
while ea > es && iter < maxit
    xr = xrold-(func(xrold)/dfunc(xrold));
    iter = iter+1;

    % Calculate approximate relative error
    ea = abs((xr-xrold)/xr*100);

    % Check if this is the root
    if func(xr) == 0, break, end

    % Replace old root
    xrold = xr;
end
root = xr;
fx = func(root);

end