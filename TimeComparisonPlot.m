N = 500;

X = randn(N, 4);
Y = randn(N, 4);
Y(:, 1) = Y(:, 1) + 0.5;
Y(:, 2) = Y(:, 2) + 0.5;
Y(:, 3) = Y(:, 3) + 0.5;
Y(:, 4) = Y(:, 4) + 0.5;

Cost = pdist2(X, Y, "squaredeuclidean");
entropy = 0.5;

% number of gradient/newtonian steps
loop = 100;

% number of sinkhorn iterations
iter = 250;

snsX = X;
sdX = X;

% sdDiv = zeros(loop, 1);
% snsDiv = zeros(loop, 1);

% for i=1:loop
% %   gradient descent using Sinkhorn divergence as evalution function
%     sdDiv(i) = SinkhornDivergence(sdX, Y, entropy, iter);
%     [~,sdGradX] = SinkhornDivergence(sdX, Y, entropy, iter);
%     sdX = sdX - 0.1 * sdGradX;
% end 
T = zeros(3, 1)
tic
[steps, finalDiv] = SubspaceNewtonSinkhorn(X,Y, entropy, iter, .5, 0);
T(1, 1) = toc
tic 
[steps2, finalDiv2] = SinkhornGradientDescent(X, Y, entropy, .5, 0.05, iter);
T(2, 1) = toc
tic
[steps3, finalDiv3] = AdamOptimizer(X, Y, entropy, 0.9, 0.99, 1e-8,.5, 0.05, iter);
T(3, 1) = toc

% xIter = 1:loop;
% figure;
% loglog(xIter, snsDiv, '.-', xIter, sdDiv, '.-');
