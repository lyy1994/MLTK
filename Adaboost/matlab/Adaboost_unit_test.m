%% Adaboost unit test
%% Loading Data
train = load('hw2_adaboost_train.dat');
test = load('hw2_adaboost_test.dat');
%% Preprocessing Data
[~,n] = size(train);
Xtrain = train(:,1:n-1);
ytrain = train(:,n);
[~,n] = size(test);
Xtest = test(:,1:n-1);
ytest = test(:,n);
%% Setting hyper parameters
hyper_para.iter = 300;
hyper_para.train = @decision_stump_train;
hyper_para.pred = @decision_stump_pred;
%% Training and Predicting using Adaboost
model = Adaboost_train(Xtrain,ytrain,hyper_para);
pred = Adaboost_pred(model,Xtrain);
fprintf('Training set 0/1 error rate : %f\n',sum(pred ~= ytrain)/length(ytrain));
pred = decision_stump_pred(Xtest,model.parameters(1));
fprintf('1st base predictor''s test set 0/1 error rate : %f\n',sum(pred ~= ytest)/length(ytest));
pred = Adaboost_pred(model,Xtest);
fprintf('Test set 0/1 error rate : %f\n',sum(pred ~= ytest)/length(ytest));