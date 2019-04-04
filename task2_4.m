%
%
function [Corrs] = task2_4(Xtrain, Ytrain)
% Input:
%  Xtrain : M-by-D data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for X
% Output:
%  Corrs  : (K+1)-by-1 vector (double) of correlation $r_{12}$ 
%           for each class k = 1,...,K, and the last element holds the
%           correlation for the whole data, i.e. Xtrain.
[EVecs, EVals] = comp_pca(Xtrain);
K=10;
Corrs = zeros(K+1,1);
d2_x = zeros(size(Xtrain,1), 2);
for i = 1:size(Xtrain,1)
    d2_x(i,:) = ([EVecs(:,1)'; EVecs(:,2)'] * Xtrain(i,:)')';
end

for i = 1:K
    corr_matrix=MyCov(d2_x(Ytrain==i,:));
    Corrs(i) = corr_matrix(1,2);
end
corr_matrix=MyCov(d2_x);
Corrs(11) = corr_matrix(1,2);

end


