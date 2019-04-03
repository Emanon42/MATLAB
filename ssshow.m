function ssshow()
figure;
hold on;
xlim([0 100]);
ylim([0 5e+06]);
Ks = [1,2,3,4,5,7,10,15,20];
for i = 1:size(Ks,2)
    filename = strcat('/afs/inf.ed.ac.uk/user/s17/s1758009/Documents/MATLAB/data/task1_5_sse_',num2str(Ks(i)),'.mat');
    txt = ['K=',num2str(Ks(i))];
    load(filename,'SSE');
    plot(SSE, 'DisplayName', txt);
end
hold off;
legend show;