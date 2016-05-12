function [y] = nn_predict(nn,X)
% parameter :
%   nn : the trained neural network model;
%   X : the data wanted to predict;
% return :
%   y : the predicted value;
[m,~] = size(X);
depth = length(nn.structure) - 1;
for i = 1:depth - 1
    X = tanh([ones(m,1),X]*nn.w{i});
end
y = sign([ones(m,1),X]*nn.w{depth});