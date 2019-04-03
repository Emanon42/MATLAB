function tttask1_7()
    Ks = [1,2,3,4,5,7,10,15,20];
    dset_dir = '/afs/inf.ed.ac.uk/group/teaching/inf2b/cwk2/d/s1758009';
    [Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dset_dir);
    Xtrn = double(Xtrn)/255.0;
    Xtst = double(Xtst)/255.0;
    for i = 1:size(Ks,2)
        c_filename = strcat('/afs/inf.ed.ac.uk/user/s17/s1758009/Documents/MATLAB/data/task1_5_c_',num2str(Ks(i)),'.mat');
        m_filename = 'task1_2_M.mat';
        evec_filename = 'task1_3_evecs';
        eval_filename = 'task1_3_evals';

        
        Dmap = task1_7(c_filename, m_filename, evec_filename, eval_filename, mean(Xtrn), 200);
        
    end
end