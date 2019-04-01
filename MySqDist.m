function D = MySqDist(X, Y)
    D = bsxfun(@plus,dot(X,X,2),dot(Y,Y,2)')-2*(X*Y');
    % dji = || xi - yj ||^2 = ||xi|| + ||yi|| - 2 * dot(xi,yi)
    % convert to matrix form ¡ü