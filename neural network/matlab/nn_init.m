function [nn] = nn_init(structure,lower,upper)
% parameter :
%   sturcture : a vector each component points out the number of units in
%   that layer(not include the bias term);
%   lower : the lower bound of the random initial weights;
%   upper : the upper bound of the random initial weights;
% return :
%   nn.sturcture : the sturcture vector;
%   nn.w(1...n) : the random initial weights;
nn.structure = structure;
for i = 2:length(structure)
    nn.w(i-1) = {unifrnd(lower,upper,structure(i-1) + 1,structure(i))};
end