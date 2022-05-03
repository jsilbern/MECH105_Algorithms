function [I] = Trap(x,y)
%Trap: This function calculates the numerical evaluation of an integral by
%   the Trapezoidal Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% Initiate Trap variable
trap = 0;
for m = 2:length(x)
    t = (y(m-1)+y(m))*((x(m)-x(m-1)))/2;
    trap = trap+t;
end
I = trap;
end