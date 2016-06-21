function [y] = decision_stump_pred(X, model)
% Given the parameters and features, make predictions using decision stump
% algorithm.

% Parameters :
%   X : features, number of data X number of features' kinds.
%   model : decision stump's data structrue.
% Return :
%   y : predictions, number of data X 1.
epsilon = 1e-6;
y = model.s * sign(X(:,model.feature) - model.theta - epsilon);