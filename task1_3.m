%
%
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.
    MinDims = [0;0;0;0];
    [EVecs, EVals] = comp_pca(X);
    CumVar = cumsum(EVals);
    counter = 0;
    for i = 1:size(CumVar,1)
        counter = CumVar(i) / CumVar(784);
        if counter >= 0.70
            MinDims(1) = i;
            break;
        end
    end
    counter = 0;
    for i = 1:size(CumVar,1)
        counter = CumVar(i) / CumVar(784);
        if counter >= 0.80
            MinDims(2) = i;
            break;
        end
    end
    counter = 0;
    for i = 1:size(CumVar,1)
        counter = CumVar(i) / CumVar(784);
        if counter >= 0.90
            MinDims(3) = i;
            break;
        end
    end
    counter = 0;
    for i = 1:size(CumVar,1)
        counter = CumVar(i) / CumVar(784);
        if counter >= 0.95
            MinDims(4) = i;
            break;
        end
    end
    
    plot(CumVar);
    xlabel('# of principal components');
    ylabel('Cumulative variance');
    saveas(gcf, 'task1_3_evals.png');

end
