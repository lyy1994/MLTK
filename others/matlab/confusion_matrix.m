function confusion_matrix(targets, predictions)
% Given targets and predictions, display their confusion matrix.
% Warning : This is only useful for classifcation problem, whoes labels
% range from 1 to number of classes.

% Parameters :
%   targets : the same meaning as their name, number of data X 1.
%   predictions : the same meaning as their name, number of data X 1.
% Return :
%   None.
kind = max(targets);
cm = zeros(kind,kind);
for i = 1:length(targets)
    cm(targets(i),predictions(i)) = cm(targets(i),predictions(i)) + 1;
end
fprintf('\t\t\tpredictions\ntargets');
disp(cm(1,:));
for i = 2:kind
    fprintf('       ');
    disp(cm(i,:));
end