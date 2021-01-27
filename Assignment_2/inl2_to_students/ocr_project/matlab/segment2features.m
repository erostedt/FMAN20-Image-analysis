function features = segment2features(I)
% Find region of interest.
[row, col] = find(I == 1);
region = [min(row), max(row); min(col), max(col)];

% Crop out region of interest.
rimg = I(region(1, 1): region(1, 2), region(2, 1): region(2, 2)); 

[m, n] = size(rimg);
min_dim = min(m, n);

features = zeros(6, 1);

center = [floor(m / 2), floor(n / 2)];
perb = [floor(m / 8), floor(n / 8)];

% Mean  value of pixel in center compared to mean value total pixels.
features(1) =  mean2(rimg( ...
                          center(1) - perb(1): center(1) + perb(1), ...
                          center(2) - perb(2): center(2) + perb(2) ...
                          )) / mean2(rimg);

% Skewness of the image.
features(2) = moment(rimg, 3, 'all');

horflip = flip(rimg, 1);
verflip = flip(rimg, 2);

elems = 1:min_dim;

% Average correlation with horizontally flipped pixels.
features(3) = sum(sum(corr(rimg(elems, elems), horflip(elems, elems)), ...
                      'omitnan')) / (min_dim ^ 2);

% Average correlation with vertically flipped pixels.
features(4) = sum(sum(corr(rimg(elems, elems), verflip(elems, elems)), ...
                      'omitnan')) / (min_dim ^ 2);


% Number of pixels where edge is detected along x-axis.
features(5) = mean2(conv2(rimg, [-1, 1]) ~= 0);

% Number of pixels where edge is detected along y-axis.
features(6) = mean2(conv2(rimg, [-1; 1]) ~= 0);
end











    
    
    
    
    
    
    
    
    
    
    
    
    
    
    