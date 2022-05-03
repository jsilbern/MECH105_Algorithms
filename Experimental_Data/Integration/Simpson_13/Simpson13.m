function [I] = Simpson13(x,y)
%Simpson13: This function calculates the numerical evaluation of an integral by
%   the Simpson 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% Check that the arrays are the same size
if length(x)~=length(y)
    error('input arrays must be the same size')
end

% Find the spacing in x
%space = zeros(1,length(x)-1);
%for p = 2:length(x)
%    space(p-1) = x(p)-x(p-1);
%end

% Check that the spacing is equal
%check = zeros(1,length(space)-1);
%iter = 1;
%for o = 2:length(space)
%    check(o-1) = space(o)-space(o-1);
%    if iter>1
%        if check(o-1) ~= 0
%            error('x is not equally spaced')
%        end
%    end
%    iter = iter+1;
%end

% See if array is even or odd
L = floor(length(x)/2)*2;

% See if only the trapezoid rule can be used
if length(x)<3
    test = 2;
    i = 1;
else
    test = 1;
end

% Run Simpson 1/3 Rule if applicable
simp = 0;
if test == 1
    for i = 3:2:length(x)
        s = (x(i)-x(i-2))*(y(i-2)+4*y(i-1)+y(i))/6;
        simp = simp+s;
    end
    if L == length(x)
        test = 2;
    end
end

% Run Trapezoid Rule if applicable
trap = 0;
if test == 2
    warning('the trapezoid rule was utilized')
    for m = i+1:length(x)
        t = (y(m-1)+y(m))*((x(m)-x(m-1)))/2;
        trap = trap+t;
    end
end

% Total both methods to find integration estimate
I = simp+trap;
end