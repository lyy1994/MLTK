%% Linear Regression unit test
% In this example we use linear regression combined with a polynomial
% transformation, which is polynomial regression, to validate the
% performance of this implementation.
errorRate = 0;
eps = 1e-9;
for  i = 1:1000
%% Generate Data
    X = unifrnd(-1,1,1000,2);
    y = f(X);
    [m,n] = size(X);
%%
% Because we approximate a quadratic function, we transform the primitive
% features into quadratic terms.
    X = polynomial_transformer(X, 2);
%%
% A better feature transformer is following:
%    X = [X,X(:,1).*X(:,2),X(:,1).^2,X(:,2).^2];
%% Training and Predicting using LR
    warning('off');
    model = lg_train(X, y);
    pred = lg_pred(model, X);
    errorRate = errorRate + sum(sign(pred - eps) ~= y)/m;
end
%% Average Results of 1000 experiments
errorRate = errorRate/1000;
fprintf('error rate : %f\n',errorRate);