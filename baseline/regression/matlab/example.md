# A simple example of Baseline predictor

The following lines of code is a simple example about how to use the baseline predictor in classification problem with *kFoldCV* and standard *0/1 error*, which is a good indicator to remind you how well your learning algorithms work, and how much accuracy you should achieve at least.

	%% Loading Data
	data = csvread('bmw-browsers.csv', 1, 0);
	%% Preprocessing Data
	X = data(:, 1:size(data, 2) - 1);
	y = data(:, size(data, 2));
	X = -(X == 0) + X;
	y = -(y == 0) + y;
	%% Baseline
	errorRate = kFoldCV(X,y,10,@classify_base_train,@classify_base_pred,@std_classify_error);
	fprintf('Baseline : %f\n', errorRate);