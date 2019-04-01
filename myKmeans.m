function cs = myKmeans(A, init_centres)
    [aa bb] = size(init_centres);
    prev_centres = zeros(aa, bb);
    cs = init_centres;
    K = size(init_centres, 1);   % extract number of clusters
    [N dim] = size(A);      % dataset dimensions
    maxiter = 100;          % Maximum number of iterations
    D = zeros(K, N);        % KxN matrix for storing distances between
                            % cluster centres and observations
    fprintf('[0] Iteration: ')
    init_centres                 % show cluster centres at iteration 0
    % Iterate ’maxiter’ times
    for i = 1:maxiter
    % Compute Squared Euclidean distance (i.e. the squared distance)
    % between each cluster centre and each observation
        for c = 1:K
            D(c,:) = square_dist(A, cs(c,:));
        end
    % Assign data to clusters
    % Ds are the actual distances and idx are the cluster assignments
        [Ds, idx] = min(D); % find min dist. for each observation
    % Update cluster centres
        for c = 1:K
    %check the number of samples assigned to this cluster
            if( sum(idx==c) == 0 )
                fprintf('k-means: cluster %d is empty', c);
            else
                cs(c, :) = mean( A(idx==c,:) );
            end
        end
        
        if(cs == prev_centres)
            myPlot(A, cs);
            break;
        end
        fprintf('[%d] Iteration: ', i)
        cs      % show cluster centres at iteration i
        prev_centres = cs;
    end

