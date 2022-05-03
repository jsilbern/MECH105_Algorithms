function [root, fx, ea, iter] = MODIFIEDSECANT(func, x_1, delta, es, maxit)
%MODIFIEDSECANT: This function calculates the root approximation of a function
%   using the Modified Secant method
%   Inputs:
%       func: the function used to calculate the root
%       x_1: the initial guess of the root
%       delta: fractional perterbation of the independant variable
%           if omitted, defaults to .000001
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
        error('must have an initial guess')
    case 2
        delta = .000001;
    case 3
        delta = .000001;
        es = 0.00001;
        maxit = 200;
    case 4
        delta = .000001;
        maxit = 200;
end

% Make sure bounds are scalars
if length(x_1) ~= 1
    error('initial guess must be a scalar value')
end

% Initiate variables
ea = 100;
iter = 0;
xrold = x_1;

% Check if guesses are the root
if func(x_1) == 0
    xr = x_1;
    ea = 0;
end

% Consult Algebrator
while ea > es && iter < maxit
    xr = x_1-delta*x_1*func(x_1)/(func(x_1+delta*x_1)-func(x_1));
    iter = iter+1;

    % Calculate approximate relative error
    ea = abs((xr-xrold)/xr*100);

    % Check if this is the root
    if func(xr) == 0, break, end

    % Replace old root
    xrold = xr;
    x_1 = xr;
end
root = xr;
fx = func(root);

end