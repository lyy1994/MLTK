# A simple example of kFoldCV

Following is a piece of code from one of my experiment, you can view it as a simple example of *kFoldCV* combined with *grid_search* and *Decision Tree* algorithm:

	data = csvread('bmw-browsers.csv', 1, 0);
	X = data(:, 1:size(data, 2) - 1);
	y = data(:, size(data, 2));
	
	best_hyper_para = [];
	best_performance = Inf;
	hyper_para_set = grid_search({[1,2,3]});
	for i = 1:size(hyper_para_set,1)
    	e = kFoldCV(X, y, 10, @DTree_train, @DTree_predict, @std_classify_error, hyper_para_set(i,:));
	    if e < best_performance
    	    best_performance = e;
    	    best_hyper_para = hyper_para_set(i,:);
   		end
	end
	
	fprintf('grid search with cv:%f\n',best_performance);