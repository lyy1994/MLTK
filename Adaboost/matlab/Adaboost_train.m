function model = Adaboost_train(X,y,hyper_para)
% Given the base predictor, features and targets, train an adaptive
% boosting algorithm.
% Warning : This implementation can only deal with binary classification
% problem and real value or binary category features.
% Warning : The base predictor used here doesn't take any hyper parameters.
% If necessary, change the structrue of hyper_para to contain base
% predictor's hyper parameters and change code in line 37 to make use of
% this hyper parameters.

% Parameters :
%   X : features, number of data X number of features' kinds
%   y : target, number of data X 1
%   hyper_para : a data structure consisted of iter, train and pred
%   iter : how many times Adaboost will iterate, integer
%   train : the training function of the base predictor, should use the
%   original X, y and weights as input, output the model parameters and
%   weighted standard classification error rate(0/1 error)
%   pred : the predict function of the base predictor, should use the
%   original X and model parameters that *train* preduced as input, output
%   the prediction
% Return :
%   model : Adaboost's data structure, consisted of iter, pred and
%   parameters
%   iter : the same as hyper_para.iter
%   pred : the same as hyper_para.pred
%   parameters : an array of base predictor's model parameters, each
%   component corresponds to a different base predictor's parameters,
%   iteration times X 1
weights = ones(size(y))./length(y);
model.iter = hyper_para.iter;
model.pred = hyper_para.pred;
model.parameters = struct('s',[],'feature',[],'theta',[],'alpha',[]);
model.parameters = repmat(model.parameters, hyper_para.iter, 1);
error = zeros(hyper_para.iter,1);
for i = 1:hyper_para.iter
    [parameters, error(i)] = hyper_para.train(X,y,weights);
    yprime = hyper_para.pred(X,parameters);
    parameters.alpha = log(sqrt((1-error(i))/error(i)));
    model.parameters(i) = parameters;
    for j = 1:length(weights)
        if yprime(j) ~= y(j)
            weights(j) = weights(j)*sqrt((1-error(i))/error(i));
        else
            weights(j) = weights(j)/sqrt((1-error(i))/error(i));
        end
    end
end