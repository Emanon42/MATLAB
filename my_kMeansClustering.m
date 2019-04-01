%
function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

  %% If 'maxIter' argument is not given, we set by default to 500
  if nargin < 4
    maxIter = 500;
  end
  
  %% TO-DO
  
  C = nan;
  idx = nan;
  SSE = nan;
  
%  [idx, C] = kmeans(X,k,'MaxIter',maxIter,'Start',initialCentres);
  
  K = size(initialCentres, 1);
  [N dim] = size(X);
  D = zeros(K, N);
  
  for i = 1:maxIter
      for c = 1:K
          D(c,:) = sum(bsxfun(@minus, X, initialCentres(c,:)).^2, 2)';
      end
      
      [Ds, idx2] = min(D);
      
      
      for c = 1:K
          if(sum(idx2 == c) ~= 0)
              initialCentres(c,:) = mean(X(idx2==c,:));
          end
      end
      

  end
  
  C = initialCentres;
  idx = idx2;
  
  
  
end
