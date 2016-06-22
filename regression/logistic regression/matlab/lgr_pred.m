function [y] = lgr_pred(model, X)
% Given trained logistic regression model and features, make predictions.

% Parameters :
%   model : logistic regression's data structure.
%   X : features, number of data X number of features' kinds.
% Return :
%   y : predictions, number of data X 1.
[m,~] = size(X);
X = [ones(m,1),X];
if model.threshold == Inf
    y = logistic(X * model.w);
else
    if model.threshold >=0 && model.threshold <= 1
        epsilon = 1e-7;
        y = sign(logistic(X * model.w) - model.threshold - epsilon);
    else
        fprintf('threshold not in range 0~1 or Inf\n');
    end
end