function [Ypreds, Ms, Covs] = run_gaussian_for_28(Xtrain, Ytrain, Xtest, epsilon)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar variable (double) for covariance regularisation
% Output:
%  Ypreds : N-by-1 matrix (uint8) of predicted labels for Xtest
%  Ms     : K-by-D matrix (double) of mean vectors
%  Covs   : K-by-D-by-D 3D array (double) of covariance matrices

%YourCode - Bayes classification with multivariate Gaussian distributions.
N = size(Xtest, 1);
K = max(Ytrain);
D = size(Xtrain,2);
prior = zeros(K,1);
mu_hat = zeros(K, D);
sigma_hat = zeros(K,D,D);
for i = 1:K
    prior(i) = size(Xtrain(Ytrain==i,:),1) / size(Xtrain,1);
    mu_hat(i,:) = MyMean(Xtrain(Ytrain==i,:));
    sigma_hat(i,:,:) = cov(Xtrain(Ytrain==i,:),1) + epsilon * eye(D,D);
end

test_prob = zeros(N,K);
for i = 1:K
    if size(Ytrain(Ytrain==i),1)~=0
%    covar = sigma_hat(i,:,:);
%     covar = reshape(covar(:,:), size(covar,2),size(covar,3));
%      lik_k = mvnpdf(Xtest,mu_hat(i,:),covar);
%     tttest = lik_k * prior(i);
        test_prob(:,i) = gaussianMV(Xtest, mu_hat(i,:),sigma_hat(i,:,:),prior(i));

    end
end

[~, Ypreds] = max(test_prob, [], 2);
Ms = mu_hat;
Covs = sigma_hat;


end