function tttask2_7(Xtrain, Ytrain, Xtest, Ytest)
ratio = [0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3];
for i = 1:size(ratio,2)
    [CM, acc] = task2_7(Xtrain, Ytrain, Xtest, Ytest, 0.01, ratio(i));
    filename = strcat('task2_7_cm_',num2str(ratio(i)*100),'.mat');
    save(filename,'CM');
end
end