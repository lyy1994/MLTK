function [weight] = pla(X,y,stepSize)
% parameter :
%   X : the training data;
%   y : the label;
%   stepSize : the update rate;
% return :
%   weight : the trained weights;
if nargin == 2
    stepSize = 1;
end
[m,n] = size(X);
weight = zeros(n,1);
eps = 1e-9;
rp = randperm(m);
while true
    check = 1;
    for i = 1:m
        if sign(X(rp(i),:)*weight-eps) ~= y(rp(i))
            check = 0;
            weight = weight + stepSize*y(rp(i))*X(rp(i),:)';
        end
    end
    if check == 1
        break
    end
end
end