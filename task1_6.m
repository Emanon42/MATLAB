%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       
% 
    load(MAT_ClusterCentres, 'C');
    k = size(C,1);
    to_show = reshape(C(1,:), 28, 28)';
    for i = 2:k
        to_show = cat(3, to_show, reshape(C(i,:), 28, 28)');
    end
    h = montage(to_show);
    file_name = strcat('task1_6_imgs_', num2str(k), '.png');
    to_save = get(h, 'CData');
    imwrite(to_save, file_name, 'png');
  
end
