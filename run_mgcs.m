function [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar parameter for regularisation (double)
%   L      : scalar (integer) of the number of Gaussian distributions per class
% Output:
%  Ypreds : N-by-1 matrix of predicted labels for Xtest (integer)
%  MMs     : (L*K)-by-D matrix of mean vectors (double)
%  MCovs   : (L*K)-by-D-by-D 3D array of covariance matrices (double)
K=10;
YtrainOverDrive = double(Ytrain);

D = size(Xtrain,2);
for i = 1:K
    cur_dataset = Xtrain(Ytrain==i,:);
    initialCentres = cur_dataset(1:L,:);
    [~, idx, ~] = my_kMeansClustering(cur_dataset, L, initialCentres);
    idx = double(idx);
    YtrainOverDrive(Ytrain==i) = (YtrainOverDrive(Ytrain==i)-1)*L + (idx-1);
    
    
end

YtrainOverDrive = uint8(YtrainOverDrive);
a=1+1;
[pred1, MMs, MCovs] = run_gaussian_for_28(Xtrain, YtrainOverDrive, Xtest, epsilon);
Ypreds = ceil(pred1 / L);


end
