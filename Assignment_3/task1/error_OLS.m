function error = error_OLS(params, x, y)

% Least square error for a y = kx + m model. 
% Sum of squared residuals.

error = sum((params(1) * x + params(2) - y).^2);
end

