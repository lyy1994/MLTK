function [models] = randomForest_train(X,y,hyper_para)
% Given features, targets and hyper parameters, build a random forest model

% Parameters :
%   X : features, number of data X number of features' kinds
%   y : target, number of data X 1
%   hyper_para : a vector consisted of treeNum and treeDepth
%   treeNum : train how many trees, integer, 1st component
%   treeDepth : tree's depth, optional, integer, 2nd component
% Return :
%   models : random forest's data structure, consisited of treeNum and DTrees
%   treeNum indicate the tree's number
%   DTrees is a vector each component corresponding to a different decision
%   tree model
models.treeNum = hyper_para(1);
for i = 1:hyper_para(1)
    idx = randi(length(y),length(y),1);
    Xprime = X(idx,:);
    yprime = y(idx);
    if length(hyper_para) == 1 
        model = DTree_train(Xprime,yprime);
    else
        model = DTree_train(Xprime,yprime,hyper_para(2));
    end
    models.DTrees(i) = model;
end