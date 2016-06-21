function [model,error] = decision_stump_train(X,y,weight)
% Given features, targets and weights for each data point, train a decision
% stump algorithm(find a best split based on weighted 0/1 error).

% Parameters :
%   X : features, number of data X number of features' kinds.
%   y : target, number of data X 1.
%   weight : weights for each data point, number of data X 1.
% Return :
%   model : decision stump's data structure, consisted of s, feature and
%   theta.
%   s : indicate which side is -1, if -1 then all data point whose values 
%   on a particular feature is less than a particular fixed value(theta) 
%   predict 1 else preidict -1.
%   feature : the feature ID which has the highest performance.
%   theta : the split point on that feature which has the highest 
%   performance.
%   error : the weighted 0/1 error, double.
[~,feature_num] = size(X);
ss = [-1,1];
le = 1;
for i = 1:feature_num
    [~,order] = sort(X(:,i));
    sortedX = X(order,:);
    thetas = zeros(size(y));
    thetas(1) = min(sortedX(:,i))-1e5;
    for j = 2:length(y)
        thetas(j) = (sortedX(j,i)+sortedX(j-1,i))/2;
    end
    for j = 1:length(thetas)
        for k = 1:length(ss)
            yprime = ss(k)*sign(X(:,i)-thetas(j));
            error = sum((yprime ~= y).*weight)/sum(weight);
            if error < le
                model.s = ss(k);
                model.feature = i;
                model.theta = thetas(j);
                le = error;
            end
        end
    end
end
error = le;