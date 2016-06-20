function distance = euclidean_distance(center, points)
% Given a fixed center point and a set of points, compute the euclidean
% distances between them

% Parameters :
%   center : the point kept fixed and needed to measure its distances to
%   other points, 1 X number of coordinate axes
%   points : other points need to measure their distance to the center,
%   number of points X number of coordinate axes
% Return :
%   distance : euclidean distances between center and points, number of
%   points X 1
[m,~] = size(points);
distance = sum((repmat(center,m,1) - points).^2, 2);