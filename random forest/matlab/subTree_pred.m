function [y] = subTree_pred(DTree,X)
% Given the tree model and features, predict the targets

% Parameters :
%   X : features, number of data X number of features' kinds
%   DTree : tree's data structure
% Return :
%   y : the prediction, number of data X 1
if DTree.data(1) == 0
    y = DTree.data(2);
    return
end
s = DTree.data(1);
feature = DTree.data(2);
theta = DTree.data(3);
if decision_stump_predict(X,s,feature,theta) == -1
    y = subTree_pred(DTree.lc,X);
else
    y = subTree_pred(DTree.rc,X);
end