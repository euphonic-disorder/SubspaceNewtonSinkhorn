function [distance, gradX, gradY, Tsinkhorn] = DivergenceFitting(x, y, alpha, i)
% inputs:
% x - discrete distribution #1
% y - discrete distribution #2
% cost - matrix of associated costs for every pairing of points in x & y
% alpha - weight of entropic regularization term
% i - # of iterations of Sinkhorn's applied

% outputs: 
% u,v - scaling factors
% Tsinkhorn - diag(u) * K * diag(v) (transportation polytope)

cost = pdist2(x, y, "squaredeuclidean");

% generate kernel
K = exp(-cost/alpha);
outputSize = height(x);

v = rand(outputSize, 1);

for iter=1:i
    %v = v / sum(v);
    
    % T * 1 = 1 -> diag(u) * K * diag(v) * 1 = 1 -> u .* Kv = 1 -> u = 1 ./ (Kv)
    u = 1 ./ (K*v);

    % vice-a-versa
    v = 1 ./ (K'*u);
end


Tsinkhorn = diag(u)*K*diag(v);

distance = sum(Tsinkhorn(:) .* cost(:)) + alpha*sum((log(Tsinkhorn(:))-1).*Tsinkhorn(:));

gradX = 2 * x - 2 * Tsinkhorn * y;
gradY = 2 * y - 2 * Tsinkhorn' * x;


end

