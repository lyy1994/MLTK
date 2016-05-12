%% PLA unit test
%% loading data
data = load('ntumlone_hw1_hw1_15_train.dat');
%% preprocessing data
eps = 1e-9;
[m,n] = size(data);
X = [ones(m,1),data(:,1:n-1)];
y = data(:,n:end);
%% two arguments call test
w1 = pla(X,y);
Ein1 = sum(sign(X * w1 - eps) ~= y) / m;
fprintf('error rate of the first call : %f\n',Ein1);
%% three arguments call test
w2 = pla(X,y,0.5);
Ein2 = sum(sign(X * w2 - eps) ~= y) / m;
fprintf('error rate of the second call : %f\n',Ein2);