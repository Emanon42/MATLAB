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
    D = zeros(k, n);

    C = initialCentres;
    idx = zeros(n,1);

    [Ds,idx] = max(bsxfun(@minus,C*X',dot(C',C',1)'/2),[],1);
    idx = idx';
    SSE_a = 0;
    for j = 1:n
        SSE_a = SSE_a + norm(X(j,:) - C(idx(j),:))^2;
    end
    SSE = SSE_a;
%     SSE = sum(Ds);

    prev_centres = 0;

    for i = 1:maxIter
%         for c = 1:k
%             D(c,:) = MySqDist(X, C(c,:));
%         end
%        [Ds, idx] = min(D);
        [Ds,idx] = max(bsxfun(@minus,C*X',dot(C',C',1)'/2),[],1);

        idx = idx';
        for c = 1:k
            if( sum(idx==c) ~= 0 )
                C(c, :) = MyMean( X(idx==c,:) );
            end
        end

        SSE_a = 0;
        for j = 1:n
            SSE_a = SSE_a + norm(X(j,:) - C(idx(j),:))^2;
        end
%         SSE_a = 0;
%         SSE_a = sum(Ds);
        SSE = [SSE;SSE_a];


        if prev_centres == C
            break;
        end

        prev_centres = C;

    end





end
