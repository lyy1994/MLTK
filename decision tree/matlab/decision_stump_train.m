function [s,feature,theta,idx] = decision_stump_train(X,y)
% Given the data and target, use decision stump algorithm to predict the
% best (binary) split of the data set

% Parameters :
%   X : features, number of data X number of features' kinds
%   y : target, number of data X 1
% Return :
%   s : indicate which side is -1, if -1 then all data point whose values on a
%   particular feature is less than a particular fixed value(theta) predict 1
%   else preidict -1
%   feature : the feature ID which has the highest performance
%   theta : the split point on that feature which has the highest performance
%   idx : indicate what each data point will predict under the highest
%   performance setting
[~,feature_num] = size(X);
ss = [-1,1];
le = 100000;
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
            e1 = sum(yprime == -1) * impurity(y((yprime == -1)));
            e2 = sum(yprime == 1) * impurity(y((yprime == 1)));
            e = e1 + e2;
            if e < le
                s = ss(k);
                feature = i;
                theta = thetas(j);
                idx = yprime;
                le = e;
            end
        end
    end
end
% fprintf('Ein:%f\n',1-baccuracy);