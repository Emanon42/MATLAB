function [covvvv] = MyCov(X)
[L,~]=size(X);
X1=X-ones(L,1)*MyMean(X);
covvvv=X1'*X1/L;
end