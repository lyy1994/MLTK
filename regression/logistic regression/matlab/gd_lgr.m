function [grad] = gd_lgr(X,y,w)
% Given the current weights, features, and targets, compute the gradients
% of error with respect to weights.

% Parameters :
%   X : features, number of data X number of features' kinds.
%   y : target, number of data X 1.
%   w : current weights, number of features' kinds X 1.
% Return :
%   grad : gradients of error with respect to weights, number of features'
%   kinds X 1.
[n,m] = size(X);
tmp = -repmat(y,1,m) .* X;
grad = tmp'*logistic(-y.*(X*w))/n;