function performance = std_classify_error(target, prediction)
% Given targets and predictions, calculate the standard classification
% error rate

% Parameters :
%   target : same meaning as the variable's name, number of targets X 1
%   prediction : same meaning as the variable's name, number of predictions
%   X 1
performance = sum(target ~= prediction)/size(target,1);