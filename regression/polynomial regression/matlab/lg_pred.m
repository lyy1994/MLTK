function [y] = lg_pred(model, X)
% Given linear regression's trained weights and features, make
% corresponding predictions.

% Parameters :
%   model : linear regression's data structure.
%   X : features, number of data X number of features' kinds.
% Return :
%   y : predictions, number of data X 1.
[m,~] = size(X);
X = [ones(m,1), X];
y = X * model.w;