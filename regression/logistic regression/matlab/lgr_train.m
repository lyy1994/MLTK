function [model] = lgr_train(X, y, hyper_para)
% Given feaures, targets and some hyper parameters settings, train the
% weights of logistic regression model.
% Warning : This implementation already concatenate x_0 = 1 into the
% primitive features, so you don't need to add x_0 = 1 by hand before you
% pass X into this function.

% Parameters :
%   X : features, number of data X number of features' kinds.
%   y : target, number of data X 1.
%   hyper_para : a data structure consisted of threshold, iterTimes and
%   eta.
%   threshold : only the computed values of trained logistic regression
%   model for given features above this threshold will the model predict 1,
%   otherwise predict -1. If you set this to Inf, it will return
%   probabilities when making predictions, double, between 0 to 1.
%   iterTimes : how many times the weights should update, integer.
%   eta : learning rate, double.
% Return :
%   model : logistic regression's model, consisted of threshold and w.
%   threshold : the same as hyper_para.threshold.
%   w : the weights for logistic regression, number of features' kinds X 1.
model.threshold = hyper_para.threshold;
[m,~] = size(X);
X = [ones(m,1),X];
[~,d] = size(X);
model.w = zeros(d,1);
for i = 1:hyper_para.iterTimes
    model.w = model.w - hyper_para.eta * gd_lgr(X,y,model.w);
end