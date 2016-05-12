%% Pocket unit test
%% loading data
data = load('ntumlone_hw1_hw1_18_train.dat');
testdata = load('ntumlone_hw1_hw1_18_test.dat');
%% preprocessing data
[m,n] = size(data);
X = [ones(m,1),data(:,1:n-1)];
y = data(:,n:end);
[tm,tn] = size(testdata);
tX = [ones(tm,1),testdata(:,1:n-1)];
ty = testdata(:,n:end);
%% setting hyperparameters
eps = 1e-9;
test_times = 2000;
%% default arguments call test
Eout = 0;
for i = 1:test_times
    w = pocket(X,y);
    result = (sign(tX*w-eps) ~= ty);
    Eout = Eout + sum(result)/length(result);
end
Eout = Eout/2000;
fprintf('error rate of the first call : %f\n',Eout);
%% self-defined arguments call test
Eout = 0;
for i = 1:test_times
    w = pocket(X,y,100);
    result = (sign(tX*w-eps) ~= ty);
    Eout = Eout + sum(result)/length(result);
end
Eout = Eout/2000;
fprintf('error rate of the second call : %f\n',Eout);