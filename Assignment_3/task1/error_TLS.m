function error = error_TLS(params, x, y)

% Total least square error for a y = kx + m model. 
% Sum of orthogonal distances.

error = error_OLS(params, x, y) / (params(1)^2 + 1);
end

