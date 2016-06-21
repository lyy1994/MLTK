function [p] = logistic(s)
p = 1./(1 + exp(-s));