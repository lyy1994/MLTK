function performance = mean_square_error(target, prediction)
% calculate the mean square error.
performance = sum((target - prediction).^2)/size(target,1);