function model = knn_train(X, y, hyper_para)
% Given features, targets and hyper parameters(k nearest neighbors), store
% them for prediction

% Parameters :
%   X : features, number of data X number of features' kinds
%   y : target, number of data X 1
%   hyper_para : data structure consisted of distance_measurement function 
%   and k
%   disstance_measurement : a function compute the distances between a
%   fixed center point and a set of points
%   k : indicate how many neighbors you chosed, integer
% Return :
%   model : knn's data structure, consisted of training data X and y,
%   hyper parameters k and distance measurement function, which is 
%   equivalent to parameters above
model.X = X;
model.y = y;
model.k = hyper_para.k;
model.distance_measurement = hyper_para.distance_measurement;