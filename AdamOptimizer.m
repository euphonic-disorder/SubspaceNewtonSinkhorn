function [steps, finalDiv] = AdamOptimizer(x, y, alpha, beta1, beta2, eps, stop, stepSize, i)
    epsilon = sqrt(eps);
    n = size(x);
    m = zeros(n);
    v = zeros(n);
    steps = [];
    [div, grad] = SinkhornDivergence(x, y, alpha, i);
    k = 0

    while div > stop
      [div, grad] = SinkhornDivergence(x, y, alpha, i);
      steps(end+1) = div;
      m = beta1 * m + (1-beta1) * grad;
      v = beta2 * v + (1-beta2) * grad.^2;
      mt = m / (1-beta1^k);
      vt = v / (1-beta2^k);
      x = x - stepSize * mt ./ (sqrt(vt) + epsilon);
      k = k + 1;
    end
    finalDiv = div;
end