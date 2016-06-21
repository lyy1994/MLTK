function [y] = lssvm_pred(model,X)
% Given lssvem's data structure and features, make binary predictions.

% Parameters :
%   model : lssvm's data structure.
%   X : features, number of data X number of features' kinds.
% Return :
%   y : predictions, number of data X 1
epsilon = 1e-7;
y = sign(model.kernel(X,model.sv,model.kernel_para) * model.beta - epsilon);