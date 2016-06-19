function [y] = decision_stump_predict(X,s,feature,theta)
% Given the decision stump parameter and features, predict the target

% Parameters :
%   X : features, number of data X number of features' kinds
%   s : indicate which side is -1, if -1 then all data point whose values on a
%   particular feature is less than a particular fixed value(theta) predict 1
%   else preidict -1
%   feature : the feature ID which has the highest performance
%   theta : the split point on that feature which has the highest performance
% Return :
%   y : the prediction, number of data X 1
y = s*sign(X(:,feature)-theta);