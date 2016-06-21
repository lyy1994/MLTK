function [K] = RBF(U,V,gamma)
% Compute two matrixes' Gaussian-RBF distance?

% Parameters :
%   U,V : number of data X number of features' kinds.
%   gamma : Gaussian-RBF kernel's parameter.
% Return :
%   K : number of data in the first input matrix X number of data in the 
%   second input matrix
[m,~] = size(U);
[n,~] = size(V);
K = zeros(m,n);
for i = 1:m
    for j = 1:n
        K(i,j) = exp(-gamma*(U(i,:)-V(j,:))*(U(i,:)-V(j,:))');
    end
end