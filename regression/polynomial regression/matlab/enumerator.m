function [new_X] = enumerator(id, X, cur_depth, max_depth)
% Using DFS to generate all possible combinations of features.
if cur_depth > max_depth
    new_X = prod(X(:,id),2);
    return
end
new_X = [];
for i = 1:size(X,2)
    id(cur_depth) = i;
    new_X = [new_X, enumerator(id, X, cur_depth + 1, max_depth)];
end