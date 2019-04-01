%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m
%
    to_show = reshape(EVecs(:,1), 28, 28)';
    for i = 2:10
        to_show = cat(3, to_show, reshape(EVecs(:,i), 28, 28)');
    end
    h = montage(to_show, 'DisplayRange', [-0.5, 0.5]);
    to_save = get(h, 'CData');
    imwrite(to_save, 'task1_4_imgs.png', 'png');


end
