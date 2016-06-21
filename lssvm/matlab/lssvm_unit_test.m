%% LSSVM unit test
%% Loading Data
data = load('hw2_lssvm_all.dat');
%% Preprocessing Data
[m,n] = size(data);
Xtrain = data(1:400,1:n-1);
ytrain = data(1:400,n);
Xtest = data(401:m,1:n-1);
ytest = data(401:m,n);
%% Setting hyper parameters
gamma = 2;
lambda = 1;
hyper_para.kernel = @RBF;
hyper_para.kernel_para = gamma;
hyper_para.lambda = lambda;
%% Training and Predicting using LSSVM
model = lssvm_train(Xtrain,ytrain,hyper_para);
pred = lssvm_pred(model,Xtrain);
Ein = sum(pred ~= ytrain)/length(pred);
pred = lssvm_pred(model,Xtest);
Eout = sum(pred ~= ytest)/length(pred);
fprintf('Training set error rate : %d\n',Ein);
fprintf('Test set error rate : %d\n',Eout);