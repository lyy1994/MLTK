function [y] = randomForest_predict(forest,X)
% Given the trained random forest model and features, make a sensible
% prediction

% Parameters :
%   forest : random forest's data structure
%   X : features, number of data X number of features' kinds
% Return :
%   y : the prediction, number of data X 1
[m,~] = size(X);
y = zeros(m,1);
for i = 1:forest.treeNum
    pred = DTree_predict(forest.DTrees(i),X);
    y = y + pred;
end
y = sign(y - 1e-7);