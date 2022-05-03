function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Inputs:
%     x: x-values for our data set
%     y: y-values for our data set
%
%   Outputs:
%     fX: x-values with outliers removed
%     fY: y-values with outliers removed
%     slope: slope from the linear regression y=mx+b
%     intercept: intercept from the linear regression y=mx+b
%     Rsquared: R^2, a.k.a. coefficient of determination

% Check array size
if length(x) ~= length(y)
    error('arrays must be the same size')
end

% Sort in ascending order
% The old school way because it makes me happy
% And my happiness matters too
for j = 1:length(y)
    holdy = y(j);
    holdx = x(j);
    for i = j+1:length(y)
        if y(i) < holdy
            y(j) = y(i);
            x(j) = x(i);
            y(i) = holdy;
            x(i) = holdx;
            holdy = y(j);
            holdx = x(j);
        end
    end
end

% Eliminate Outliers
Q1 = floor((length(y)+1)/4);
Q3 = floor((3*length(y)+3)/4);
Q1 = y(Q1);
Q3 = y(Q3);
IQR = Q3-Q1;
n = Q1-1.5*IQR;
m = Q3+1.5*IQR;
index = 1;
for i = 1:length(y)
    if y(i) > n && y(i) < m
        newy(index) = y(i);
        newx(index) = x(i);
        index = index+1;
    end
end

% Calculate Equation Stuff
% Calculate Means
n = length(newy);
meany = 0;
meanx = 0;
for i = 1:n
    meany = meany+newy(i);
    meanx = meanx+newx(i);
    if i == n
        meany = meany/n;
        meanx = meanx/n;
    end
end

% Calculate the Sum of the Squares of the Residuals about the Mean
% Something like that
St = 0;
for i = 1:n
    St = St+(newy(i)-meany).^2;
end

% Calculate the Slope
b1 = 0;
sumx = 0;
sumy = 0;
b3 = 0;
b4 = 0;
for i = 1:n
    b1 = b1+newx(i)*newy(i);
    sumx = sumx+newx(i);
    sumy = sumy+newy(i);
    b3 = b3+newx(i)^2;
    b4 = b4+newx(i);
    if i == n
        b1 = n*b1;
        b2 = sumx*sumy;
        b3 = n*b3;
        b4 = b4^2;
    end
end

a1 = (b1-b2)/(b3-b4);

% Calculate the y-intercept
a0 = meany-a1*meanx;

% Calculate the Sum of the Squares of the Residuals about the Regression
Sr = 0;
for i = 1:n
    Sr = Sr+(newy(i)-a0-a1*newx(i))^2;
end

% Calculate the Coefficient of Determination
Rsquared = (St-Sr)/St;

% Outputs and whatnot
fX = newx;
fY = newy;
slope = a1;
intercept = a0;
end