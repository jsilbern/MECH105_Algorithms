function [root, fx, ea, iter] = FALSEPOSITION(func, xl, xu, es, maxit)
%FALSEPOSITION: This function calculates the root approximation of a function
%   using the false position method
%   Inputs:
%       func: the function used to calculate the root
%       xl: the lower bound of the root
%       xu: the upper bound of the root
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
        error('must have a lower and an upper bound')
    case 2
        error('must have an upper bound')
    case 3
        es = 0.00001;
        maxit = 200;
    case 4
        maxit = 200;
end

% Make sure bounds are scalars
if length(xl) ~= 1 && length(xu) ~= 1
    error('bounds must be scalar values')
end

% Check if guesses bracket the root
if func(xu)*func(xl) > 0
    error('bounds do not bracket the root')
end

% Initiate variables
ea = 100;
iter = 0;

% Check if guesses are the root
if func(xu) == 0
    xr = xu;
    ea = 0;
elseif func(xl) == 0
    xr = xl;
    ea = 0;
end

% Consult Algebrator
while ea > es && iter < maxit
    xr = xu-(func(xu)*(xl-xu))/(func(xl)-func(xu));
    iter = iter+1;

    % Calculate approximate relative error
    if iter > 1
        ea = abs((xr-xrold)/xr*100); 
    end

    % Check if this is the root
    if func(xr) == 0, break, end

    % Replace old root
    if func(xr)*func(xl) > 0
        xl = xr;
    elseif func(xr)*func(xu) > 0
        xu = xr;
    end

    xrold = xr;
end
root = xr;
fx = func(root);

end