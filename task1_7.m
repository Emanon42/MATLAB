%
%
function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

    load(MAT_ClusterCentres, 'C');
    load(MAT_M, 'M');
    load(MAT_evecs, 'EVecs');
    load(MAT_evals, 'EVals');
    
    
    V = [EVecs(:,1), EVecs(:,2)];
    m2 = V' * (M(end,:) - posVec)';
    
    
    x_axis = linspace(m2(1) - 5*sqrt(EVals(1)), m2(1) + 5*sqrt(EVals(1)), nbins);
    y_axis = linspace(m2(2) - 5*sqrt(EVals(2)), m2(2) + 5*sqrt(EVals(2)), nbins);
    [x_v, y_v] = meshgrid(x_axis, y_axis);
    grid = [x_v(:), y_v(:)];
    high_dim_vecs = (V * grid' + posVec')';
%     k = size(C, 1);
%     D = zeros(k, nbins*nbins);
%     for c = 1:k
%         D(c,:) = MySqDist(high_dim_vecs, C(c,:));
%     end
%     [Ds, idx] = min(D);
    [Ds, idx] = max(bsxfun(@minus,C*high_dim_vecs',dot(C',C',1)'/2),[],1);
    Dmap = reshape(idx, nbins, nbins);
    name_img = strcat('task1_7_imgs_',num2str(size(C,1)),'.png');
    
    contourf(x_axis(:), y_axis(:), Dmap);
    saveas(gcf, name_img);
    
    name_mat = strcat('task1_7_dmap_',num2str(size(C,1)),'.mat');
    save(name_mat, 'Dmap');
    
    
    
			  
end
