function dddis(X)
% Input:
%  Evecs : the same format as in comp_pca.m
%
    to_show = reshape(X(1,:), 28, 28)';
    for i = 2:5
        to_show = cat(3, to_show, reshape(X(i,:), 28, 28)');
    end
    h = montage(to_show);


end