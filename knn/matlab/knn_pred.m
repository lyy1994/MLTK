function [y] = knn_pred(model,X)
% Given features and knn's model, predict the corresponding targets

% Parameters :
%   model : knn's model, a data structure
%   X : features, number of data X number of features' kinds
% Return :
%   y : predictions, number of data X 1
[m,~] = size(X);
y = zeros(m,1);
epsilon = 1e-6;
for i = 1:m
    distance = model.distance_measurement(X(i,:),model.X);
    [~,idx] = sort(distance);
    y(i) = sign(sum(model.y(idx(1:model.k))) - epsilon);
end