function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

U = A;
% Determine the size of A
[r,c] = size(U);

% Check if it's square
if r ~= c
    error('matrix must be square')
end

% Create Pivot Matrix and Lower Triangular Matrix
P = eye(r,c);
L = zeros(r,c);

for m = 1:r-1
    % Isolate the row in matrix A
    a = U(m:r,m)';
    % Find the maximum value
    [maximum,loc] = max(abs(a));
    % Check to see if it is already where it should be
    if loc ~= 1
        % If not, partial pivot A and switch P and L matrices
        l = loc+m-1;
        store(1,:) = U(m,:);
        store(2,:) = P(m,:);
        store(3,:) = L(m,:);
        U(m,:) = U(l,:);
        P(m,:) = P(l,:);
        L(m,:) = L(l,:);
        U(l,:) = store(1,:);
        P(l,:) = store(2,:);
        L(l,:) = store(3,:);
    end

    % Forward Elimination
    for i = (m+1):r
        PEl = U(i,m)/U(m,m);
        PEq = U(m,:)*PEl;
        U(i,:) = U(i,:)-PEq;
        L(i,m) = PEl;
    end
end

% Insert Ones for L matrix 
for n = 1:r
    L(n,n) = 1;
end
end
