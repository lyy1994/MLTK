%% feed-forward neural network unit test
%% loading data
train = load('hw4_nnet_train.dat');
test = load('hw4_nnet_test.dat');
%% preprocessing data
[~,n] = size(train);
Xtrain = train(:,1:n-1);
ytrain = train(:,n);
[~,n] = size(test);
Xtest = test(:,1:n-1);
ytest = test(:,n);
%% setting hyperparameters
stepSize = 0.1;
range = 0.1;
hidden = [1;6;11;16;21];% number of neurons in the hidden layer
iterTimes = 50000;
repeat_times = 10;
%% training and predicting using neural network
for i = 1:length(hidden)
    Eout = 0;
    for j = 1:repeat_times
        % number of neurons in the first layer should not include bias term
        structure = [n - 1,hidden(i),1];
        nn = nn_init(structure,-range,range);
        nn = nn_train(nn,Xtrain,ytrain,stepSize,iterTimes);
        yprime = nn_predict(nn,Xtest);
        Eout = Eout + sum(yprime ~= ytest)/length(ytest);
    end
    Eout = Eout/repeat_times;
    fprintf('number of hidden units : %d Eout : %f\n',hidden(i),Eout);
end