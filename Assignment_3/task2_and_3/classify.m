function nn = classify(x, classification_data)
% Nearest neighbour algorithm.

data = classification_data(1:end-1, :);
classes = classification_data(end, :);

% Data points
dps = length(classes);

min_dist = Inf;
nn = 1;
for dp = 1:dps
    dist = norm(x - data(:, dp));
    if dist < min_dist
        min_dist = dist;
        nn = classes(1, dp);
    end
end
end

