%% Random Forest unit test
%% Loading Data
train = load('hw3_train.dat');
test = load('hw3_test.dat');
%% Preprocessing Data
[~,n] = size(train);
Xtrain = train(:,1:n-1);
ytrain = train(:,n);
Xtest = test(:,1:n-1);
ytest = test(:,n);
%% Setting Parameters
iterTimes = 10;
Ein = 0;
Eout = 0;
%% Training and Predicting using RF
for i = 1:iterTimes
    model = randomForest_train(Xtrain,ytrain,300);
    pred = randomForest_predict(model,Xtrain);
    Ein = Ein + sum(pred ~= ytrain)/length(ytrain);
    pred = randomForest_predict(model,Xtest);
    Eout = Eout + sum(pred ~= ytest)/length(ytest);
end
Ein = Ein/iterTimes;
Eout = Eout/iterTimes;
%%
fprintf('300*100 Training set error rate : %f\n',Ein);
fprintf('300*100 Test set error rate : %f\n',Eout);