function y = sign(X)
% Because *sign* function in Matlab will output 0 when X equals to 0. If
% you want to output -1 when X equals to 0, use this function, else if you
% want to output 1 when X equals to 0, modify the minus(-) symbol between X
% and epsilon to plus(+) symbol. Also you can modify the precision of
% epsilon to any value you want.
epsilon = 1e-7;
y = sign(X - epsilon);