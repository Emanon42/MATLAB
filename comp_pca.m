function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
  %% TO-DO
    
    %EVecs = zeros(size(X,2),size(X,2));
    %EVals = zeros(size(X,2),1);
    
    cov_m = cov(X);
    [e_vecs, e_vals] = eig(cov_m);
    e_vals = sum(e_vals,2);
    for i = 1:size(e_vecs,1)
        if e_vecs(1,i) < 0
            e_vecs(:,i) = -e_vecs(:,i);
            e_vals(i) = -e_vals(i);
        end
    end
    
    
    [a_sorted, a_order] = sort(e_vals);
    EVecs = e_vecs(:,a_order);
    EVals = a_sorted;
    EVecs = flip(EVecs, 2);
    EVals = flip(EVals);
end

