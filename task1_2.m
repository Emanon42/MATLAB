%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.
    M = zeros(11, size(X, 2));
    total_mean = reshape(mean(X), 28, 28)';
    M(11,:) = mean(X);
    for i = 0:9
        Y2 = find(Y == (9-i));
        mean_v = zeros(1, size(X, 2));
        for j = 1:size(Y2, 1)
            mean_v = mean_v + X(Y2(j), :);
        end
        mean_v = mean_v / size(Y2, 1);
        M((9-i)+1, :) = mean_v;
        total_mean = cat(3, total_mean, reshape(mean_v, 28, 28)');
    end
        file_name = 'task1_2_imgs.png';
        total_mean = flip(total_mean, 3);
        h = montage(total_mean);
        to_save = get(h, 'CData');
        imwrite(to_save, file_name, 'png');

end
