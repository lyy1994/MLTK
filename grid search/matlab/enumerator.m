function combinations = enumerator(possibleValues, hyper_parameters, cur_depth)
% Use Depth-First-Search to enumerate all possible combinations

% parameters :
%   possibleValues : a cell vector, each cell contains all its possible values, 1 X hyper-parameters' kinds
%   hyper_parameters : one possible combination of hyper-parameters, 1 X hyper-parameters' kind
%   cur_depth : current depth, 1 X 1 integer
% return :
%   combinations : all possible combinations among all possible values of hyper-parameters, number of combinations X number of hyper-parameters
if cur_depth > length(possibleValues)
    combinations = hyper_parameters;
    return
end
combinations = [];
values = possibleValues{cur_depth};
for i = 1:length(values)
    hyper_parameters(cur_depth) = values(i);
    Ncombinations = enumerator(possibleValues, hyper_parameters, cur_depth + 1);
    combinations = [combinations; Ncombinations];
end