function [x,y,z] = contourGauss2D(mu,covar)

step = 0.1;
C = covar;
A = inv(C);
var = diag(C);
maxsd = max(var(1),var(2));
x = mu(1)-2*maxsd:step:mu(1)+2*maxsd;
y = mu(2)-2*maxsd:step:mu(2)+2*maxsd;
[X, Y] = meshgrid(x,y);
z = 1/(2*pi*sqrt(det(C)))*exp(-0.5*(A(1,1)*(X-mu(1)).^2+2*A(1,2)*(X-mu(1)).*(Y-mu(2)) + A(2,2)*(Y-mu(2)).^2));
end