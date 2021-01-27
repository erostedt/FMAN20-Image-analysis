function features = segment2features(I)

% Find region of interest.
[row, col] = find(I == 1);
region = [min(row), max(row); min(col), max(col)];

% Crop out region of interest.
rimg = I(region(1, 1): region(1, 2), region(2, 1): region(2, 2)); 

[m, n] = size(rimg);

features = [];

boxes = 4;

box_width = floor(n / boxes);
box_height = floor(m / boxes);


for x = 1:boxes
    for y = 1:boxes
        box = rimg((y - 1) * box_height + 1: y * box_height, ...
                            (x - 1) * box_width + 1: x * box_width);
        features = [features; sum(box, 'all') / (box_width * box_height)];
    end
end











    
    
    
    
    
    
    
    
    
    
    
    
    
    
    