function [sDiv, sdGradX, G1, G2] = SinkhornDivergence(x, y, alpha, i)
    % inputs:
    % x - discrete distribution #1
    % y - discrete distribution #2
    % cost - matrix of associated costs for every pairing of points in x & y
    % alpha - weight of entropic regularization term
    % i - # of iterations of Sinkhorn's applied
    
    % outputs: 
    % Tsd - unbiased sinkhorn transportation polytope
    
    % base sinkhorn distance
    [Dist, G1,~, ~] = SinkhornDistance(x, y, alpha, i);
    
    % regularization terms
    [DistX,G2,~, ~] = SinkhornDistance(x, x, alpha, i);
    DistY = SinkhornDistance(y, y, alpha, i);
    
    % sinkhorn loss
    sDiv = 2 * Dist - DistX - DistY;
    
    % gradient w/ respect to x
    sdGradX = G1 - G2;
    
    end
    