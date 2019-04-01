%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
    for i = 0:9
        Y2 = find(Y == i);
        Y2 = Y2(1:10);
        display = cat(3, reshape(X(Y2(1),:), 28, 28)', reshape(X(Y2(2),:), 28, 28)');
        for j = 3:10
            display = cat(3, display, reshape(X(Y2(j),:), 28, 28)');
        end
        file_name = strcat('task1_1_imgs_class', num2str(i), '.png');
        h = montage(display);
        to_save = get(h, 'CData');
        imwrite(to_save, file_name, 'png');
    end
end
