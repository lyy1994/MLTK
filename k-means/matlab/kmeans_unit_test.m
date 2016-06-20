%% K-means unit test
%% Loading Data
data = load('hw4_kmeans_train.dat');
%% Setting Parameters
repeat_times = 10;
%% Setting hyper parameters
hyper_para.k = 2;
hyper_para.distance_measurement = @euclidean_distance;
hyper_para.iterTimes = 1000;
%% Clustering using K-means
MSE = 0;
for i = 1:repeat_times
    [~,~,tmp] = kmeans(data,hyper_para);
    MSE  = MSE + tmp;
end
MSE = MSE / repeat_times;
fprintf('2 centroids MSE : %f\n',MSE);