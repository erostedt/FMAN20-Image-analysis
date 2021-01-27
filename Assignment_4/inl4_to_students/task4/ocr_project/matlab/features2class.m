function class = features2class(x, classification_data)
    % Try 3-nearest neighbour algorithm, if tie, choose 1-nearest.

    % Pick out data.
    data = classification_data(1:end-1, :);
    classes = classification_data(end, :);

    % Run 3-nearest neighbours.
    knn = classes(knnsearch(data', x', 'K', 3));

    % Find number of occurrences for each number.
    [group_counts, groups] = groupcounts(knn');

    % Fetch the most common neighbour number and
    % number of occurrences for that neighbour number.
    [most_freq_val, most_freq_group] = max(group_counts);

    % If tie choose 1 nearest.
    if length(find(group_counts == most_freq_val)) > 1
        class = classes(knnsearch(data', x', 'K', 1));

    % Else choose most common amongst 3-nearest neighbours.
    else
        class = groups(most_freq_group);
    end
end