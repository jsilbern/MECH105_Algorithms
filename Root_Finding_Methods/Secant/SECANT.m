function [root, fx, ea, iter] = SECANT(func, x_0, x_1, es, maxit)
%SECANT: This function calculates the root approximation of a function
%   using the Secant method
%   Inputs:
%       func: the function used to calculate the root
%       x_0: the initial guess of the root
%       x_1: the second guess of the root
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
        error('must have a primary and seondary guess')
    case 2
        error('must have a secondary guess')
    case 3
        es = 0.00001;
        maxit = 200;
    case 4
        maxit = 200;
end

% Make sure bounds are scalars
if length(x_0) ~= 1 && length(x_1) ~= 1
    error('initial guess must be a scalar value')
end

% Initiate variables
ea = 100;
iter = 0;
xrold = x_1;

% Check if guesses are the root
if func(x_0) == 0
    xr = x_0;
    ea = 0;
elseif func(x_1) == 0
    xr = x_1;
    ea = 0;
end

% Consult Algebrator
while ea > es && iter < maxit
    xr = x_1-(func(x_1)*(x_0-x_1))/(func(x_0)-func(x_1));
    iter = iter+1;

    % Calculate approximate relative error
    ea = abs((xr-xrold)/xr*100);

    % Check if this is the root
    if func(xr) == 0, break, end

    % Replace old root
    xrold = xr;
    x_0 = x_1;
    x_1 = xr;
end
root = xr;
fx = func(root);

end