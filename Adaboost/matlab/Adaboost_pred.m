function [y] = Adaboost_pred(model, X)
% Given Adaboost's trained parameters and features, make predictions using
% Adaboost algorithm.

% Parameters :
%   model : Adaboost's data structure consisted of all parameters and base
%   predictor function
%   X : features, number of data X number of features' kinds
% Return :
%   y : predictions, number of data X 1
[m,~] = size(X);
y = zeros(m,1);
epsilon = 1e-6;
for i = 1:model.iter
    y = y + model.parameters(i).alpha .* model.pred(X,model.parameters(i));
end
y = sign(y - epsilon);