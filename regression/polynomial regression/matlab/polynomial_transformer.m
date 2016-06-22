function [new_X] = polynomial_transformer(X, order)
% Given raw features like [x_1, x_2], transfrom them in to higher order
% polynomial terms, like order 2 [x_1, x_2, x_1*x_1, x_1*x_2, x_2*x_1, 
% x_2*x_2]

% Parameters :
%   X : features, number of data X number of features' kinds.
%   order : the highest order of the transformed polynomial terms.
% Returns :
%   new_X : transfromed features, number of data X number of polynomial
%   terms.
new_X = [];
for i = 1:order
    id = zeros(1,i);
    new_X = [new_X, enumerator(id, X, 1, i)];
end