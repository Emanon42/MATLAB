function task2_8(Xtrain, Ytrain, Xtest, Ytest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Xtrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ytest  : N-by-1 label vector (uint8) for Xtest
%   epsilon : A scalar parameter for regularisation
%   L      : scalar (integer) of the number of Gaussian distributions per class
tic
[Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L);
toc
[cm, acc] = comp_confmat(Ytest, Ypreds);
filename = strcat('task2_8_cm_',num2str(L),'.mat');
save(filename,'cm');
Ms1 = MMs(1:L,:);
MCovs = MCovs(1:L,:,:);
filename2 = strcat('task2_8_g',num2str(L),'_m1.mat');
filename3 = strcat('task2_8_g',num2str(L),'_cov1.mat');
save(filename2,'Ms1');
save(filename3,'MCovs');

disp(size(Xtest,1));
disp(size(Xtest,1)*(1-acc));
disp(acc);

end
