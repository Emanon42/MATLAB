function tttask1_6()
    Ks = [1,2,3,4,5,7,10,15,20];
    for i = 1:size(Ks,2)
        filename = strcat('/afs/inf.ed.ac.uk/user/s17/s1758009/Documents/MATLAB/data/task1_5_c_',num2str(Ks(i)),'.mat');
        task1_6(filename);
    end
end
        