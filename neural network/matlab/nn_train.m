function [nn] = nn_train(nn,X,y,hyper_para)
% parameter :
%   nn : the neural network model;
%   X : the training data;
%   y : the label;
%   hyper_para : vector consisted of stepSize and iterTimes
%   stepSize : the step size of gradient descent;
%   iterTimes : the iterating times of stochastic gradient descent;
% return :
%   nn : the trained neural network model;
stepSize = hyper_para(1);
iterTimes = hyper_para(2);
m = length(y);
depth = length(nn.structure) - 1;
for i = 1:iterTimes
    % randomly pick one data point
    idx = unidrnd(m);    
    % calculate X
    x = {[1,tanh(([1,X(idx,:)]*nn.w{1}))]'};
    for j = 2:depth - 1
        x(j) = {[1,tanh(x{j-1}'*nn.w{j})]'};
    end
    x(depth) = {(x{depth-1}'*nn.w{depth})'};
    % calculate delta
    delta = cell(1,depth);
    delta(depth) = {-2*(y(idx)'-x{depth})};
    for j = depth-1:-1:1
        w = nn.w{j+1};
        x0 = x{j};
        delta(j) = {w(2:end,:)*delta{j+1}.*(1-x0(2:end).^2)};
    end
    % update w
    nn.w(1) = {nn.w{1} - stepSize * [1,X(idx,:)]' * delta{1}'};
    for j = 2:depth
        nn.w(j) = {nn.w{j} - stepSize * x{j-1} * delta{j}'};
    end
end