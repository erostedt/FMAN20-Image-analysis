function [S] = im2segment(im)
% Author: Eric Rostedt

% Transform histogram to uniform (will also be normalized between [0, 1]).
transformed_image = histeq(im / 256);

% Make image binary with a threshold 0.82.
binary_image = medfilt2(transformed_image > 0.82);

% Find 4-neighbour connected components in binary image.
[connected_components, num_components] = bwlabel(binary_image, 4);

% Keeps track of the index of the i:th true image.
image_idx = 1;

% Iterate over the connected components
for component_idx = 1:num_components
    
    % Fetch images of current connected component
    curr_bin_image = connected_components == component_idx;
    
    % If connected component is large enough, we assume that the connected
    % component really is an image of a number, otherwise we skip it.
    if sum(curr_bin_image, 'all') > 30
        S{image_idx} = curr_bin_image;
        image_idx = image_idx + 1;
    end
end
