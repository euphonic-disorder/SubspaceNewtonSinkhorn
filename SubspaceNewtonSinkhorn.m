function [steps, finalDiv] = SubspaceNewtonSinkhorn(x, y, alpha, i, stop, hess)
steps = [];

[snsDiv, gradF, G1, G2, v] = SinkhornDivergence(x, y, alpha, i);

g = @(W, GG1, GG2, XX, warmV) WarmSinkhornDistance(XX + W(1) * GG1 + W(2) * GG2, y, alpha, 3, warmV);

while snsDiv > stop

    % calculate gradient of Sinkhorn Divergence and "gradient direction parts"
    [snsDiv, gradF, G1, G2, v] = SinkhornDivergence(x, y, alpha, i);
    steps(end + 1) = snsDiv;

    % generate gradient of g
    gradG = [sum(gradF(:) .* G1(:)) sum(gradF(:) .* G2(:))];


    % generate hessian of g w/ divided difference
    % (https://rh8liuqy.github.io/Finite_Difference.html#hessian-matrix)
    initial = zeros(2);
    hessG = ones(2, 2);
    h=0.1;
    for i=1:2
        for j=1:2
           if ~(i==2 && j==1) 
            ei = zeros(2);
            ei(i) = 1;
            ej = zeros(2);
            ej(j) = 1;

            g1 = g(initial + h * ei + h * ej, G1, G2, x, v);
            g2 = g(initial + h * ei - h * ej, G1, G2, x, v);
            g3 = g(initial - h * ei + h * ej, G1, G2, x, v);
            g4 = g(initial - h * ei - h * ej, G1, G2, x, v);
            
            numdiff = (g1 - g2 - g3 + g4)/(4 * h * h);
            hessG(i,j) = numdiff;
           end
        end
    end

    % apply newton's method
    W = -(hessG + eye(2) * hess) \ gradG';

    % update x_{k-1} to x_k
    x = x + W(1) * G1 + W(2) * G2;
end
finalDiv = snsDiv;
end
