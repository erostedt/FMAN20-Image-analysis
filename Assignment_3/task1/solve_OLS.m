function params = solve_OLS(x, y)
% Finds optimal parameters k, m for y = kx + m model using least square.
A = [x, ones(size(x))];

% Normal equations: A^T * A * \theta = A^T * y
params =  A' * A \ (A' * y);
end

