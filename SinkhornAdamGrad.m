function [outputArg1,outputArg2] = SinkhornAdamGrad(x, y, alpha, i)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% generate first and second moments
m = zeros()

outputArg1 = inputArg1;
outputArg2 = inputArg2;
sdDiv(i) = SinkhornDivergence(sdX, Y, entropy, iter);
[~,sdGradX] = SinkhornDivergence(sdX, Y, entropy, iter);
sdX = sdX - 0.05 * sdGradX;
end

