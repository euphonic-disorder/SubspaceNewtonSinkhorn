function [T] = Wasserstein(x, y, cost)
% inputs:
% x - discrete distribution #1
% y - discrete distribution #2
% cost - matrix of associated costs for every pairing of points in x & y

% output:
% T - fully optimized transport polytope

outputSize = height(x);

cvx_begin
    variable T(outputSize, outputSize)
    minimize sum(T(:) .* cost(:))
    subject to 
        T >= 0
        sum(T) == 1
        sum(T') == 1
cvx_end

T = full(T);
end

