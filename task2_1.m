%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
tic    
[Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks);
toc
for i = 1:size(Ypreds,2)
    [CM, acc] = comp_confmat(Ytest, Ypreds(:,i));
    name_cm = strcat('task2_1_cm_',num2str(Ks(i)),'.mat');
    save(name_cm, 'CM');
    disp(Ks(i));
    disp(size(Xtest,1));
    disp(size(Xtest,1)-trace(CM));
    disp(acc);
    
end
