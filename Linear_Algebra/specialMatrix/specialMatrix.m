function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns

% Check to make sure that the number of inputs is correct
if nargin ~= 2
    error('This function requires inputs for both the number of rows and columns')
end

% Preallocate the size of array A
A = zeros(n,m);

% Start a for-end loop to act as the location for the rows
for i=1:n
    % Start a for-end loop to act as the location for the column
    for j=1:m
        % If the row location is 1, increment the columns by 1 according to the "column" for-end loop
        if i==1
            A(i,j)=j;
        % If the column location is 1, increment the rows by 1 according to the "row" for-end loop
        elseif j==1
            A(i,j)=i;
        % For every other location, let the value at that location be the sum of the number above and to the left
        else
            A(i,j)=A(i-1,j)+A(i,j-1);
        end
    end
end
end