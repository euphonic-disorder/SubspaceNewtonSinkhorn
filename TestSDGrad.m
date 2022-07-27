clear
N = 10;

X = randn(N, 2);
Y=X;
% Y = randn(N, 2);
% Y(:, 1) = Y(:, 1) + 7.3;

[distance, gradX] = SinkhornDivergence(X, Y, 0.2, 1000);

dividedDiffGrad = zeros(N, 2);

d = @(XX) SinkhornDistance(XX, Y, 0.2, 1000);

for i=1:N
    for j=1:2
        v = zeros(N, 2);
        v(i, j) = 1;
        h=1e-6;
        dividedDiffGrad(i, j) = (d(X+h*v) - d(X-h*v))/(2*h);
    end
end

dividedDiffGrad
gradX
abs(gradX - dividedDiffGrad) ./ abs(gradX)