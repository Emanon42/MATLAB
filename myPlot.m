function myPlot(A, centre)
    K = size(centre, 1);
    colors = {'r.', 'g.', 'b.', 'k.'};
    figure
    scatter(A(:,1), A(:,2), '+');
    for c = 1:K
        hold on;
        scatter(centre(c,1), centre(c,2), 300, colors{c});
    end
