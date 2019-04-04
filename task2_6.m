%
%
function Dmap = task2_6(X, Y, epsilon, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X        : M-by-D data matrix (double)
%  Y        : M-by-1 label vector (uint8)
%  epsilon  : scalar (double) for covariance matrix regularisation
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec   : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) denoting the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.
    load(MAT_evecs, 'EVecs');
    load(MAT_evals, 'EVals');
    
    
    V = [EVecs(:,1), EVecs(:,2)];
    m2 = V' * (MyMean(X) - posVec)';
    
    
    x_axis = linspace(m2(1) - 5*sqrt(EVals(1)), m2(1) + 5*sqrt(EVals(1)), nbins);
    y_axis = linspace(m2(2) - 5*sqrt(EVals(2)), m2(2) + 5*sqrt(EVals(2)), nbins);
    [x_v, y_v] = meshgrid(x_axis, y_axis);
    grid = [x_v(:), y_v(:)];
    high_dim_vecs = (V * grid' + posVec')';
    b = (nbins*nbins)/4;
    c = (nbins*nbins)/2;
    d = (3*(nbins*nbins))/4;
    
    tic
    [Yp_a, ~, ~] = run_gaussian_classifiers(X, Y, high_dim_vecs(1:b,:), epsilon);
    [Yp_b, ~, ~] = run_gaussian_classifiers(X, Y, high_dim_vecs(b+1:c,:), epsilon);
    [Yp_c, ~, ~] = run_gaussian_classifiers(X, Y, high_dim_vecs(c+1:d,:), epsilon);
    [Yp_d, ~, ~] = run_gaussian_classifiers(X, Y, high_dim_vecs(d+1:nbins*nbins,:), epsilon);
    toc
    Ypreds = [Yp_a;Yp_b;Yp_c;Yp_d];
    
    Dmap = reshape(Ypreds, nbins, nbins);    
    contourf(x_axis(:), y_axis(:), Dmap);
			  
end
