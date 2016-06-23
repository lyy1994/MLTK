function [model] = regression_base_train(X, y)
% Given targets, use its mean as predictions.
% Warning : X is not necessary for baseline predictor. However, I still
% keep X for consistency with other learning algorithms, which is gonna be
% useful when applied to kFoldCV etc.

% Parameters :
%   X : features, number of data X number of features' kinds.
%   y : target, number of data X 1.
% Retrun :
%   model : a data structure only consisted of target, which is the mean of
%   y.
model.target = sum(y) / size(y, 1);