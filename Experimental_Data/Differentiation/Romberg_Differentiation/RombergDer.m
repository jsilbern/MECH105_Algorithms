function [D,ea] = RombergDer(f,x,h,n)
%RombergDer: Estimates the derivative of a function using Romberg Derivation
%   Inputs:
%       f = the function to be derivated
%       a = the lower bound of derivation
%       b = the upper bound of derivation
%       n = the number of iterations of the romberg equation
%   Outputs:
%       I = the derivative estimate
%       ea = the approximate relative error for the derivation iterations

index = 1;
D = zeros(n,n);
for m = 0:n-1
    delta = h/2^m;
    ex = [x-delta x x+delta];
    D(index,1) = (f(ex(3))-f(ex(1)))/(2*delta);
    index = index+1;
end

for k = 2:n
    for j = 1:n+1-k
        D(j,k) = (4^(k-1)*D(j+1,k-1)-D(j,k-1))/(4^(k-1)-1);
    end
end

ea = zeros(1,n);
for e = 2:n
    ea(e) = (D(1,e)-D(2,e-1))/D(1,e)*100;
end
end
