function [steps, finalDiv] = SinkhornGradientDescent(x, y, alpha, stop, stepSize, i)
    steps =  [];
    [div, grad] = SinkhornDivergence(x, y, alpha, i);
    k = 1;
    
    while div > stop 
    [div, grad] = SinkhornDivergence(x, y, alpha, i);
    steps(end+1) = div;
    div
    x = x - stepSize * grad;
    end
    finalDiv = div;
    end
    