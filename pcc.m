function res = pcc(u,v)
    res = (v * (u'))  / (size(v,2) - 1);
end

%{
to calculate pcc matrix
for i = 1:row
    critic_pcc(i, :) = pcc(z, z(i,:));
end
%}