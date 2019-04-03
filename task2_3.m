%
%
function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)
%c = size(Y,1);
c =3;
[EVecs, EVals] = comp_pca(X);
d2_x = zeros(size(X,1), 2);
for i = 1:size(X,1)
    d2_x(i,:) = ([EVecs(:,1)'; EVecs(:,2)'] * X(i,:)')';
end


figure;
hold on;

for j = 1:size(d2_x,1)
    if Y(j) == 1
        scatter(d2_x(j,1), d2_x(j,2), 'r', 'o');
    end
end

end
