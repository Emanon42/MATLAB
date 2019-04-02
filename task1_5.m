%
%
function [C, idx, SSE] = task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours

    k = size(Ks,2);
    
    for i = 1:k
        initialCentres = X(1:Ks(i),:);
        c_file_name = strcat('task1_5_c_', num2str(Ks(i)), '.mat');
        idx_file_name = strcat('task1_5_idx_', num2str(Ks(i)), '.mat');
        sse_file_name = strcat('task1_5_sse_', num2str(Ks(i)), '.mat');
        [C, idx, SSE] = my_kMeansClustering(X, Ks(i), initialCentres);
        save(['C:\MATLAB\data\',c_file_name], 'C');
        save(['C:\MATLAB\data\',idx_file_name],'idx');
        save(['C:\MATLAB\data\',sse_file_name],'SSE');
    end
end
