N = 1000;

X = randn(N, 4);
Y = randn(N, 4);
Y(:, 1) = Y(:, 1) - mean(Y(:, 1));
Y(:, 2) = Y(:, 2) - mean(Y(:, 2));
Y(:, 3) = Y(:, 3) - mean(Y(:, 3));
Y(:, 4) = Y(:, 4) - mean(Y(:, 4));

Cost = pdist2(X, Y, "squaredeuclidean");
entropy = 0.5;

% number of gradient/newtonian steps
loop = 100;

% number of sinkhorn iterations
iter = 250;

snsX = X;
sdX = X;

sdDiv = zeros(loop, 1);
snsDiv = zeros(loop, 1);

for i=1:loop
%   gradient descent using Sinkhorn divergence as evalution function
    sdDiv(i) = SinkhornDivergence(sdX, Y, entropy, iter);
    [~,sdGradX] = SinkhornDivergence(sdX, Y, entropy, iter);
    sdX = sdX - 0.1 * sdGradX;
end 

for i=1:loop
    snsDiv(i) = SinkhornDivergence(snsX, Y, entropy, iter);
    [~,~,snsX] = SubspaceNewtonSinkhorn(snsX, Y, entropy, iter);
end 

xIter = 1:loop;
figure;
loglog(xIter, snsDiv, '.-', xIter, sdDiv, '.-');
title('4 Dimension Convergence Comparison')
legend('Subspace Newtonian','Gradient Descent')
xlabel('Number of Iterations') 
ylabel('Sinkhorn Divergence') 
