%
%
function [C, idx, SSE] = task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours

    k = size(Ks,2);
    initialCentres = X(1:k,:);
    [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres);
end
