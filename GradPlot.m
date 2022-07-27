N = 10;

X = randn(N, 2);
Y = randn(N, 2);
Y(:, 1) = Y(:, 1) +5;

Cost = pdist2(X, Y, "squaredeuclidean");

[distance, gradX, gradY, Tsink] = SinkhornDistance(X, Y, 0.2, 100);

figure;
hold on;
plot(X(:, 1), X(:, 2), 'r.');
hold on;
plot(Y(:, 1), Y(:, 2), 'bx')


% while sum(abs(gradX(:))) > 0.75
%     hold on;
%     
% %   gradient descent using Sinkhorn distance as evalution function
%     
%     quiver(X(:,1), X(:, 2), -gradX(:, 1), -gradX(:, 2), 1/3, color=[0.4660 0.6740 0.1880]);
%     X = X - 0.1 * gradX;
%     [~,gradX,~,~] = SinkhornDistance(X, Y, 0.2, 1000);
%     
% end

sdX = X;
for i=1:1000
    hold on;
    [~,sdGradX] = SinkhornDivergence(sdX, Y, 0.2, 1000);
    quiver(sdX(:,1), sdX(:, 2), -sdGradX(:, 1), -sdGradX(:, 2), 1/3, color=[0.4940 0.1840 0.5560]);
    sdX = sdX - 0.025 * sdGradX;
end 

axis equal;
title('Sinkhorn Iterations');