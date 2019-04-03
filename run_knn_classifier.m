function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest
N = size(Xtest,1);
L = size(Ks,2);
%Ytrain = Ytrain';
Ypreds = zeros(N, L);

% generate distance matrix and sort
% D = zeros(size(Xtrain,1),size(Xtest,1));
% for c = 1:size(Xtrain,1)
%     D(c,:) = MySqDist(Xtest, Xtrain(c,:));
% end
D = pairWsqDist(Xtest',Xtrain');
[~,in] = sort(D, 2, 'ascend');

% cut up Ks(c) columns and use mode(2) to give most frequent cluster
for c = 1:L
    Z = in(:, 1:Ks(1,c));
    Ypreds(:,c) = mode(Ytrain(Z),2);
end

end
