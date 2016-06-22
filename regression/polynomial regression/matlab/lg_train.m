function [model] = lg_train(X, y)
% Given features and targets, compute the closed form solution of linear
% regression.

% Parameters :
%   X : features, number of data X number of features' kinds.
%   y : target, number of data X 1.
% Return :
%   model : linear regression's data structure, only consisted of w.
%   w : weights of linear regression, number of features' kinds X 1.
[m,~] = size(X);
X = [ones(m,1), X];
model.w = X' * X \ X' * y;