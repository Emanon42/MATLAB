%
%
function Dmap = task2_2(Xtrain, Ytrain, k, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  Xtrain   : M-by-D data matrix (double)
%  k   : scalar (integer) - the number of nearest neighbours
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) - the number of bins for each PCA axis
% Output:
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.


    load(MAT_evecs, 'EVecs');
    load(MAT_evals, 'EVals');
    
    
    V = [EVecs(:,1), EVecs(:,2)];
    m2 = V' * (MyMean(Xtrain) - posVec)';
    
    
    x_axis = linspace(m2(1) - 5*sqrt(EVals(1)), m2(1) + 5*sqrt(EVals(1)), nbins);
    y_axis = linspace(m2(2) - 5*sqrt(EVals(2)), m2(2) + 5*sqrt(EVals(2)), nbins);
    [x_v, y_v] = meshgrid(x_axis, y_axis);
    grid = [x_v(:), y_v(:)];
    high_dim_vecs = (V * grid' + posVec')';
    b = (nbins*nbins)/4;
    c = (nbins*nbins)/2;
    d = (3*(nbins*nbins))/4;
    tic
    [Yp_a] = run_knn_classifier(Xtrain, Ytrain, high_dim_vecs(1:b,:), [k]);
    [Yp_b] = run_knn_classifier(Xtrain, Ytrain, high_dim_vecs(b+1:c,:), [k]);
    [Yp_c] = run_knn_classifier(Xtrain, Ytrain, high_dim_vecs(c+1:d,:), [k]);
    [Yp_d] = run_knn_classifier(Xtrain, Ytrain, high_dim_vecs(d+1:nbins*nbins,:), [k]);
    toc
    Ypreds = [Yp_a;Yp_b;Yp_c;Yp_d];
%    [Ypreds] = run_knn_classifier(Xtrain, Ytrain, high_dim_vecs, [k]);

    Dmap = reshape(Ypreds, nbins, nbins);
    %name_img = strcat('task1_7_imgs_',num2str(size(C,1)),'.png');
    
    contourf(x_axis(:), y_axis(:), Dmap);

end
