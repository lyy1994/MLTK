function weight = pocket(X,y,round)
% parameter :
%   X : the training data;
%   y : the label;
%   round : the numbers of update times;
% return :
%   weight : the best weights ever found;
if nargin == 2
    round = 50;
end
[m,n] = size(X);
W = zeros(n,1);
weight = zeros(n,1);
eps = 1e-9;
rp = randperm(m);
min_err = sum(sign(X * weight - eps) ~= y);
count = 0;
while true
    for j = 1:m
        if sign(X(rp(j),:)*W-eps) ~= y(rp(j))
            W = W + y(rp(j))*X(rp(j),:)';
            count = count + 1;
            %pocket step
            err = sum(sign(X * W - eps) ~= y);
            if err < min_err
                weight = W;
                min_err = err;
            end
            %end pocket step
            if count == round
                return
            end
        end
    end
end
end