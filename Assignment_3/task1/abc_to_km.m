function new_params = abc_to_km(params)

% Transform line equation from ax + by + c = 0 to y = kx + m. 
% Assumed order: params(1) = a, params(2) = b, params(3) = c.
% k = -a/b, m = -c/b

new_params = [-params(1)/params(2), -params(3)/params(2)];
end
