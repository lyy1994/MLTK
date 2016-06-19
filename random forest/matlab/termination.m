function [son] = termination(X,y)
% Given features and targets, determine whether to stop build-tree process
% or not

% Parameters :
%   X : features, number of data X number of features' kinds
%   y : target, number of data X 1
% Return :
%   son : if true stop build-tree process else continue
son = true;
[m,n] = size(X);
% all x the same
for i = 1:m
    if sum(X(i,:) ~= X(1,:))
        son = false;
    end
end
if son
    return
end
% impurity equal to 0
s = impurity(y);
if s <= 1e-7
    son = true;
else
    son = false;
end