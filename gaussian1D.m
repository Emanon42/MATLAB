function p = gaussian1D(mu, var, x)
    % Evaluate a 1D-Gaussian
    diff = (x - mu);
    % Evaluate pdf of Gaussian using Eq. 1
    p = 1/sqrt(2 * pi * var) * exp(-0.5 * diff .* diff/var);
    end