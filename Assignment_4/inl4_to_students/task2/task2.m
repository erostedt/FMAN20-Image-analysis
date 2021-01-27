load('heart_data.mat')

[M, N] = size(im);
n = M * N;

% Background parameters.
params_bg = [mean(background_values), std(background_values)]; 

% Chamber parameters
params_ch = [mean(chamber_values), std(chamber_values)]; 

nu = 7;

% Construct problem.
Neighbors = edges4connected(M, N);
i = Neighbors(:, 1);
j = Neighbors(:, 2);
A = sparse(i, j, nu, n, n);

T = [neg_loglike(im(:), params_bg), neg_loglike(im(:), params_ch)];
T = sparse(T);

% Solve.
[~, segmented_im] = maxflow(A, T);
segmented_im = reshape(segmented_im, M, N);
segmented_im = double(segmented_im);

imshow(segmented_im)

