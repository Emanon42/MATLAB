function similarity = sim_measure(r2)
% Convert Euclidean distance to similarity measure
similarity = 1 ./ (1 + r2);
end

%{
for i = 1:row
    critic_dist(i, :) = sim_measure(sqrt(square_dist(z, z(i,:))));
end
%}