%
%
function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)
%c = size(Y,1);
c =3;
[EVecs, EVals] = comp_pca(X);
d2_x = zeros(size(X,1), 2);
for i = 1:size(X,1)
    d2_x(i,:) = ([EVecs(:,1)'; EVecs(:,2)'] * X(i,:)')';
end

K = 10;
prior = zeros(K,1);
mu_hat = zeros(K, 2);
sigma_hat = zeros(2,2,K);
for i = 1:K
    prior(i) = size(d2_x(Y==i,:),1) / size(d2_x,1);
    mu_hat(i,:) = MyMean(d2_x(Y==i,:));
    sigma_hat(:,:,i) = cov(d2_x(Y==i,:),1);
end

figure;
hold on;

for i = 1:K
    %[x,y,z] = contourGauss2D(mu_hat(i,:), sigma_hat(:,:,i));
    %scatter(d2_x(Y==i,1),d2_x(Y==i,2),'.');
    %contour(x,y,z);
    
    x0 = mu_hat(i,1);
    y0 = mu_hat(i,2);
    
    sh = sigma_hat(:,:,i);
    
    [evecs, evals] = eig(sh);
    evals = sum(evals,2);
    [a_sorted, a_order] = sort(evals);
    evecs = evecs(:,a_order);
    evals = a_sorted;
    evecs = flip(evecs, 1);
    evecs = evecs(:,1);
    evals = flip(evals);
    
    if sh(1,1) < sh(2,2)
        a0 = sqrt(sh(1,1));
        b0 = sqrt(sh(2,2));
    else
        a0 = sqrt(sh(2,2));
        b0 = sqrt(sh(1,1));
    end
    rotate = 0.5*pi - atan(evecs(2)/evecs(1));
    rotate_matrix = [cos(rotate),-sin(rotate);sin(rotate),cos(rotate)];
    t = -pi: 0.01 : pi;
    xx=a0*cos(t);
    yy=b0*sin(t);
    neo_loc = rotate_matrix * [xx;yy];
    %plot(xx,yy);
    plot(x0+neo_loc(1,:),y0+neo_loc(2,:));
    text(x0,y0,num2str(i-1));
    
    
    
end


end
