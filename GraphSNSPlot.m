N = 10;

X = randn(N, 2);
Y = randn(N, 2);
Y(:, 1) = Y(:, 1) + 5;

Cost = pdist2(X, Y, "sqeuclidean");
entropy = 0.2;

% number of gradient/newtonian steps
loop = 25;

% number of sinkhorn iterations
iter = 1000;

figure;
hold on;
axis equal;

tX = X;
sdX = X;
snsX = X;

% for i=1:loop
% %   gradient descent using Sinkhorn distance as evalution function
%     [~,gradX,~,~] = SinkhornDistance(tX, Y, entropy, iter);
%     gX = tX;
%     tX = tX - 0.1 * gradX;
%     for j=1:N
%        hold on;
%        plot([tX(j,1) gX(j,1) ], [tX(j,2) gX(j,2)],'-x', 'color', [1 0 0 1]);
%
%        % red
%     end
%
% end

% for i=1:loop
% %   gradient descent using Sinkhorn divergence as evalution function
%     gX = sdX;
%     [~,sdGradX] = SinkhornDivergence(sdX, Y, entropy, iter);
%     sdX = sdX - 0.1 * sdGradX;
%     for j=1:N
%         hold on;
%         plot([sdX(j,1) gX(j,1)],[sdX(j,2) gX(j,2)],'-x', 'color', [0 0 0 1]);
%         % black
%     end
% end

for i=1:loop
    gX = snsX;
    [~,~,snsX] = SubspaceNewtonSinkhorn(snsX, Y, entropy, iter);
    for j=1:N
        hold on;
        plot([gX(j,1) snsX(j,1)],[gX(j,2) snsX(j,2)],'-x', 'color', [0 0.5 0 1]);
        % green
    end

end


plot(X(:, 1), X(:, 2), 'r.');
hold on;
plot(Y(:, 1), Y(:, 2), 'b.','markersize',10)

title('Subspace Newton Sinkhorn Method')
