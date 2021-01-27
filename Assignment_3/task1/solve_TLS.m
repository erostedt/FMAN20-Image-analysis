function params = solve_TLS(x, y)

% Finds optimal parameters k, m for y = kx + m model 
% using total least square.

% First order terms:
x_sum = sum(x);
y_sum = sum(y);
[N, ~] = size(x);

% Second order terms:
x_sq_sum = sum(x.^2);
xy_sum = sum(x.*y);
y_sq_sum = sum(y.^2);


A = [x_sq_sum - (1 / N) * x_sum ^ 2, xy_sum - (1 / N) * x_sum * y_sum; 
     xy_sum - (1 / N) * x_sum * y_sum, y_sq_sum - (1 / N) * y_sum ^ 2];
 
[eigvecs, ~] = eig(A);
% Test the best!

cs = -(1 / N) * (eigvecs(:,1) * x_sum + eigvecs(:,2) * y_sum);

models = [abc_to_km([eigvecs(1, 1), eigvecs(2, 1), cs(1)]); ...
          abc_to_km([eigvecs(1, 2), eigvecs(2, 2), cs(2)])];

[~, best_idx] = min([error_TLS(models(1, :), x, y), ...
                    error_TLS(models(2, :), x, y)]);

params = models(best_idx, :);
end

