function [model] = lssvm_train(X,y,hyper_para)
% Given features, targets, kernel and hyper parameters, use an analytic
% solution under square error to solve binary classification problem.

% Parameters :
%   X : features, number of data X number of features' kinds
%   y : target, number of data X 1
%   hyper_para : a data structrue consisted of lambda, kernel and
%   kernel_para.
%   lambda : lssvm's hyper parameters, double
%   kernel : kernel function, used two matrixes(number of data X number of
%   features' kinds) and a data structure consisted of necessary parameters
%   as input and a matrix(number of data in the first input matrix X number
%   of data in the second input matrix) as output.
%   kernel_para : a data structure consisted of all necessary parameters
%   for kernel function.
model.sv = X;
model.kernel = hyper_para.kernel;
model.kernel_para = hyper_para.kernel_para;
model.lambda = hyper_para.lambda;
model.beta = (hyper_para.lambda * eye(length(y)) + hyper_para.kernel(X,X,hyper_para.kernel_para)) \ y;