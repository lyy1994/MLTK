function performance = std_classify_error(target, prediction)
% calculate the standard classification error rate
performance = sum(target ~= prediction)/size(target,1);