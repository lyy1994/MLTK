function node = buildSubTree(X,y,Cur_depth,Max_depth)
% Given the features, targets and the depth limitation, build a tree by
% using Depth-First-Search algorithm

% Parameters :
%   X : features, number of data X number of features' kinds
%   y : target, number of data X 1
%   Cur_depth : tree's current depth, integer
%   Max_depth : tree's depth limitation, integer
% Return :
%   node : tree's data structure

% termination
if termination(X,y) || Cur_depth > Max_depth
    node.data = zeros(3,1);
    node.data(1) = 0;
    if sum(y == 1) > sum(y == -1)
        node.data(2) = 1;
    else
        node.data(2) = -1;
    end
    return
end
% branching
[s,feature,theta,Didx] = decision_stump_train(X,y);
node.data = [s;feature;theta];
lc = buildSubTree(X((Didx == -1),:),y(Didx == -1),Cur_depth + 1,Max_depth);
node.lc = lc;
rc = buildSubTree(X((Didx == 1),:),y(Didx == 1),Cur_depth + 1,Max_depth);
node.rc = rc;