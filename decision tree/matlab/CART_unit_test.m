%% Classification & Regression Tree unit test
%% Loading Data
train = load('hw3_train.dat');
test = load('hw3_test.dat');
%% Preprocessing Data
[~,n] = size(train);
Xtrain = train(:,1:n-1);
ytrain = train(:,n);
Xtest = test(:,1:n-1);
ytest = test(:,n);
%% Training and Predicting using CART
% Without depth limitation
model = DTree_train(Xtrain,ytrain);
pred = DTree_predict(model,Xtest);
fprintf('Test set error rate : %f\n',sum(pred ~= ytest)/length(ytest));
%%
% With depth limitation
model = DTree_train(Xtrain,ytrain,3);
pred = DTree_predict(model,Xtest);
fprintf('Test set error rate : %f\n',sum(pred ~= ytest)/length(ytest));