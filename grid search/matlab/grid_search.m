function combinations = grid_search(possibleValues)
% Given all possible values of all hyper-parameters, calculate all possible combinations of hyper-parameters

% parameters :
%    possibleValues : a cell vector, each cell contains all its possible values, 1 X hyper-parameters' kinds
% return :
%   combinations : all possible combinations among all possible values of hyper-parameters, number of combinations X number of hyper-parameters
n = length(possibleValues);
hyper_parameters = zeros(1, n);
combinations = enumerator(possibleValues, hyper_parameters, 1);