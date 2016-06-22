%% Logistic Regression unit test
%% Loading Data
train = load('ntumlone_hw3_hw3_train.dat');
test = load('ntumlone_hw3_hw3_test.dat');
%% Preprocessing Data
[~,n] = size(train);
Xtrain = train(:,1:n-1);
ytrain = train(:,n);
[~,n] = size(test);
Xtest = test(:,1:n-1);
ytest = test(:,n);
%% Setting hyper parameters
hyper_para.eta = 0.01;
hyper_para.iterTimes = 2000;
hyper_para.threshold = 0.5;
%% Training and Predicting using LGR
model = lgr_train(Xtrain,ytrain,hyper_para);
pred = lgr_pred(model,Xtest);
errorRate = sum(pred ~= ytest)/length(ytest);
fprintf('Test set error rate : %f\n',errorRate);