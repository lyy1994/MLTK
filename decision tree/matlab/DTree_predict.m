function [y] = DTree_predict(DTree,X)
% Given the tree model and features, predict the targets

% Parameters :
%   X : features, number of data X number of features' kinds
%   DTree : tree's data structure
% Return :
%   y : the prediction, number of data X 1
[m,~] = size(X);
y = zeros(m,1);
for i = 1:m
    y(i) = subTree_pred(DTree,X(i,:));
end