% optimality gap vs wall clock time
optimalityGap = 


% experiment #1 
% property tested - covariance
% # of dimensions = 4
% 1) Unit diagonal covariance
% 2) 10^{-2} diagonal covariance
% 3) 10^{-4} diagonal covariance

% 250 points
N = 250



% experiment #2
% property tested - variance
% # of dimensions = 4
% 1) large variance \tau = 0.1
% 2) low variance \tau = 10^{-4}

% experiment #3
% property tested - curse of dimensionality
% 1) d = 4
% 2) d = 8
% 3) d = 16
% 4) d = 32
N = 250;
entropy = 0.2;
iter = 250;

X = randn(N, 4);
Y = randn(N, 4);
Y(:, 1) = Y(:, 1) + 5;
Y(:, 2) = Y(:, 2) + 5;
Y(:, 3) = Y(:, 3) + 5;
Y(:, 4) = Y(:, 4) + 5;

% experiment #4 
% property tested - resilience to varied entropy
% 1) low entropy \alpha = 10^{-3}
% 2) mid entropy \alpha = 10^{-1}
% 3) high entropy \alpha = 0.5
% 4) super high entropy \alpha = 1

% experiment #5
% property tested - resilience to varying population size