# A simple example of Baseline predictor

The following lines of code is a simple example about how to use the baseline predictor in regression problem with *kFoldCV* and standard *MSE*, which is a good indicator to remind you how well your learning algorithms work, and how much accuracy you should achieve at least.

	%% Baseline
	errorRate = kFoldCV(X,y,10,@regression_base_train,@regression_base_pred,@mean_sqare_error);