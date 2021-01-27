% Make image binary.
honeycomb = imbinarize(rgb2gray(imread('honeycomb.jpg')));

% Honeycomb is hexagonal so we use a six sided "disk".
structure_element = strel('disk', 6, 6);

% Erode image to remove borders to simplify finding filled combs.
eroded = imerode(honeycomb, structure_element);

% Find filled combs.
filled_cells = zeros(size(honeycomb));
[connected_components, N] = bwlabel(eroded, 4);
for conn_comp = 1:N
    if length(find(connected_components == conn_comp)) > 100
        filled_cells = filled_cells + double(connected_components == conn_comp);
    end
end

% Remove filled combs and reduce noise.
honeycomb = honeycomb - filled_cells;
honeycomb = medfilt2(honeycomb);

% Negate to let ones be where the combs are.
honeycomb = ~honeycomb;

% Segment out all combs using 4-neighbours:
cells = {};
cell_positions = {};
[found_combs, num_combs] = bwlabel(honeycomb, 4);
for comb = 1:num_combs
    [row, col] = find(found_combs == comb);
    
    if length(row) > 100
        region = [min(row), max(row); min(col), max(col)];
        
        % Add comb position and image of comb.
        cell_positions{end+1} = region; 
        cells{end+1} = honeycomb(region(1, 1): region(1, 2), ...
                                 region(2, 1): region(2, 2));
    end
end
% We display the Image and one segmented comb.
imshow(honeycomb)
figure
i = 190;
imshow(cells{i});
cell_positions{i}













