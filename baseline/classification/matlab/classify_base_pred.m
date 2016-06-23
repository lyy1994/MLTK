function [y] = classify_base_pred(model, X)
% Given the label of majority class within training set, use it as our
% predictions.

% Parameters :
%   model : a data structure only consisted of the majority class's label.
%   X : features, number of data X number of features' kinds
% Return :
%   y : predictions, number of data X 1
y = repmat(model.label, size(X, 1), 1);