function [I,ea] = RombergInt(f,a,b,n)
%Romberg: Estimates the integration of a function using Romberg Integration
%   Inputs:
%       f = the function to be integrated
%       a = the lower bound of integration
%       b = the upper bound of integration
%       n = the number of iterations of the romberg equation
%   Outputs:
%       I = the integration estimate
%       ea = the approximate relative error for the integration iterations

index = 1;
I = zeros(n,n);
for m = 0:n-1
    s = 2^m;
    h = linspace(a,b,s+1);
    t = 0;
    for i = 2:s+1
        t = t+(f(h(i))+f(h(i-1)))/2*(h(i)-h(i-1));
    end
    I(index,1) = t;
    index = index+1;
end

for k = 2:n
    for j = 1:n+1-k
        I(j,k) = (4^(k-1)*I(j+1,k-1)-I(j,k-1))/(4^(k-1)-1);
    end
end

ea = zeros(1,n);
for e = 2:n
    ea(e) = (I(1,e)-I(2,e-1))/I(1,e)*100;
end
end