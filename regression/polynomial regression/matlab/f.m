function [y] = f(X)
% y = sign(-0.6 + x_1^2 + x_2^2) with 10% noise
eps = 1e-9;
y = sign(X(:,1).^2 + X(:,2).^2 - 0.6 - eps);
[m,n] = size(y);
flip = unifrnd(1,100,m,n);
flip = (flip <= 10);
for i = 1:length(y)
    if flip(i) == 1
        y(i) = -y(i);
    end
end