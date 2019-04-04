%
%
function task2_5(Xtrain, Ytrain, Xtest, Ytest, epsilon)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  epsilon : a scalar variable (double) for covariance regularisation
tic
[Yp_gau, ms_gau, covs_gau] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon);
toc
[cm, acc] = comp_confmat(Ytest, Yp_gau);
save('task2_5_cm.mat','cm');
M10 = ms_gau(10,:);
Cov10 = covs_gau(10,:,:);
save('task2_5_m10.mat','M10');
save('task2_5_cov10.mat','Cov10');

disp(size(Xtest,1));
disp(size(Xtest,1)*(1-acc));
disp(acc);


end
