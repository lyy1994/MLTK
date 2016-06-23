function [model] = classify_base_train(X, y)
% Given targets/labels, use the majority class as predictions.
% Warning : X is not necessary for baseline predictor. However, I still
% keep X for consistency with other learning algorithms, which is gonna be
% useful when applied to kFoldCV etc.

% Parameters :
%   X : features, number of data X number of features' kinds.
%   y : target, number of data X 1.
% Retrun :
%   model : a data structure only consisted of label, which is the label of
%   the majority class within our training set.
if sum(y == -1) > sum(y == 1)
    model.label = -1;
else
    model.label = 1;
end