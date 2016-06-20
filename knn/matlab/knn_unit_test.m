%% K Nearest Neighbors unit test
%% Loading Data
train = load('hw4_knn_train.dat');
test = load('hw4_knn_test.dat');
%% Preprocessing Data
[~,n] = size(train);
Xtrain = train(:,1:n-1);
ytrain = train(:,n);
Xtest = test(:,1:n-1);
ytest = test(:,n);
%% Setting hyper parameters
hyper_para.k = 5;
%%
% The following line of code shows that you can use any kind of distance
% measurement function(implemented by hand) such that you can handle any
% kinds of data and different distance measurement requirements.
hyper_para.distance_measurement = @euclidean_distance;
%% Training and Predicting using knn
model = knn_train(Xtrain, ytrain, hyper_para);
pred = knn_pred(model, Xtest);
%%
% A Hint for calculating error: by implementing different kinds of error
% measurement function, you can benefit from this.
Eout = std_classify_error(ytest, pred);
fprintf('5nn error rate : %f\n',Eout);