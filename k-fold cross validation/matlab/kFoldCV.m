function [Eval] = kFoldCV(X, y, k, train, predict, error, hyper_para)
% Given the algorithms, data set and number of folds, measure the average
% validation error.
% Warning: make sure that the number of data can be divided by k

% parameters :
%   X : features, number of data X number of features' kinds
%   y : target, number of data X 1
%   k : number of folds
%   train : the algorithm you would like to train(arguments:features,targets,hyper_para)
%   predict : the algorithm corresponding to 'train'(arguments:model,features)
%   error : the error criterion(argument:prediction, target)
%   hyper_para : one combinations of hyper-parameters, 1 X number of all
%   hyper-parameters
% result :
%    Eval : the average error on validation set
[m,n] = size(X);
foldsize = m/k;
Eval = 0;
for i = 1:k
    Xtrain = [X(1:(i-1)*foldsize,:);X(i*foldsize+1:end,:)];
    ytrain = [y(1:(i-1)*foldsize,:);y(i*foldsize+1:end,:)];
    Xval = X((i-1)*foldsize+1:i*foldsize,:);
    yval = y((i-1)*foldsize+1:i*foldsize,:);
    if nargin == 6
        model = train(Xtrain,ytrain);
    else
        model = train(Xtrain,ytrain,hyper_para);
    end
    pred = predict(model,Xval);
    Eval = Eval + error(pred, yval);
end
Eval = Eval/k;