function [model] = DTree_train(X,y,depth)
% Given features and targets, build a full(without depth)/depth-limited(with depth) decision tree(base on implementation of impurity.m, currently is CART)
% Warning: data can only be real value features or binary category, target can only be binary category -1, 1

% Parameters :
%   X : features, number of data X number of features' kinds
%   y : target, number of data X 1
%   depth : tree's depth, optional, integer
% Return :
%   model : tree's data structure consisted of data, lc and rc
%   data is a vector, [s;feature;theta](see decision stump document)
%   lc & rc are model pointers which point to the left/right sub-tree
if nargin == 2
    Max_depth = Inf;
    model = buildSubTree(X,y,1,Max_depth);
else
    Max_depth = depth;
    model = buildSubTree(X,y,1,Max_depth);
end