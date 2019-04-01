function [data_S, data_E] = generateData(prior_S, prior_E, lik_S, lik_E, N)
    num_features = size(lik_S, 2);
    data_S = [];
    data_E = [];
    while (size(data_S, 1) < N || size(data_E, 1) < N)
        sample = rand(1);
        f_samples = rand(1, num_features);
        if (sample <= prior_S) && (size(data_S, 1) < N)
            gen_s = f_samples < lik_S;
            data_S = [data_S; gen_s];
        end
        if(sample > prior_S) && (size(data_E, 1) < N)
            gen_s = f_samples < lik_E;
            data_E = [data_E; gen_s];
        end
    end