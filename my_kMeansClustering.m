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
  [n,dim] = size(X);
  
  C = initialCentres;
  idx = zeros(n,1);
  [~,idxx] = min(MySqDist(C,X),[],1);
  Exx = norm(X - C(idxx,:)) .^ 2;
  SSE = sum(Exx(:));
  last_centres = 0;
  
  for i = 1:maxIter
      [~,idx] = min(pdist2(C,X).^2,[],1);
      for c = 1:k
            if( sum(idx==c) ~= 0 )
                C(c, :) = mean( X(idx==c,:) );
            end
      end
      
      if last_centres == C
          break;
      end
      
      Ex = norm(X - C(idx,:)) .^ 2;
      E = sum(Ex(:));
      SSE = [SSE, E];
      last_centres = C;
      
  end

  
  
  
  
end
