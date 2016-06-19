function [s] = impurity(y)
% Given targets, calculate the impurity(Gini Index currently)

% Parameters :
%   y : vector
% Return :
%   s : impurity
N = length(y);
s = 1 - ((sum(y == -1)/N)^2 + (sum(y == 1)/N)^2);