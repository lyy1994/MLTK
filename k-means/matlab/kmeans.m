function [labels,centroids,MSE] = kmeans(X,hyper_para)
% Given data, number of clusters, distance measurement function and
% iteration times, find clusters give local minima of MSE

% Parameters :
%   X : features, number of data X number of features' kinds
%   hyper_para : data structrue consisted of k, distance_measurement and
%   iterTimes
%   k : number of clusters, integer
%   distance_measurement : function to measure distances between two data
%   point
%   iterTimes : iteration times, integer or Inf(if no bound)
[m,~] = size(X);
labels = zeros(m,1);
distances = zeros(m,hyper_para.k);
notconverge = true;
iters = 0;
% random initialise centroids
idx = randperm(m);
centroids = X(idx(1:hyper_para.k),:);
% iterate alternately
while notconverge && iters < hyper_para.iterTimes
    iters = iters + 1;
    % update labels
    for i = 1:hyper_para.k
        distances(:,i) = hyper_para.distance_measurement(centroids(i,:),X);
    end
    [~,labels] = min(distances,[],2);
    % update centroids
    newcentroids = centroids;
    for i = 1:hyper_para.k
        newcentroids(i,:) = sum(X(labels == i,:))/sum(labels == i);
    end
    % converge or not
    if newcentroids == centroids
        notconverge = false;
    else
        centroids = newcentroids;
    end
end
% if need to return MSE(mean square error) 
if nargout == 3
    MSE = 0;
    for i = 1:m
        for j = 1:hyper_para.k
            if labels(i) == j
                MSE = MSE + hyper_para.distance_measurement(X(i,:),centroids(j,:));
            end
        end
    end
    MSE = MSE/m;
end