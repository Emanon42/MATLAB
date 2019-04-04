function y = gaussianMV(X, mu, covar, prior)
[n,d] = size(X);

covar = reshape(covar(:,:), size(covar,2),size(covar,3));
invcov = inv(covar);
mu = reshape(mu,1,d);
X = X - ones(n,1)*mu;
fact = sum(((X*invcov).*X), 2);
a = 1+1;
y = -0.5 * fact - 0.5 * logdet(covar) + log(prior);


% fact = sum(((X*invcov).*X), 2);
% y = exp(-0.5*fact);
% y = y ./ sqrt((2*pi) ^ d * det(covar));
end