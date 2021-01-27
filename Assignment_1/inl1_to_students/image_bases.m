%% Task 8
% Author: Eric Rostedt

load assignment1bases.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate mean error for all combinations of basis and data set

[~, num_bases] = size(bases);
[~, num_stacks] = size(stacks);

% Iterate over all bases
for base_idx = 1:num_bases
    % Extract current basis and convert to cell array, necessary for the
    % projection implementation.
    basis = num2cell(bases{base_idx}, [1, 2]);
    
    % Iterate over all data sets
    for stack_idx = 1:num_stacks
        
        % Extract data set and convert to cell array to make iteration
        % simpler.
        stack = num2cell(stacks{stack_idx}, [1, 2]);
        mean_error = 0;
        
        % Iterate over all images.
        for img = stack
            
            % Calculate projection and increase error.
            proj = projection(img{1}, basis);
            mean_error = mean_error + norm(img{1} - proj, 'fro');
        end
        
        % Take average and display mean error.
        mean_error = mean_error / num_images;
        fprintf('mean error for base %d and stack %d: %f \n', base_idx, stack_idx, mean_error);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Print out images of data set and bases.

% four images from first set
figure

subplot(2, 2, 1)
imshow(uint8(stacks{1}(:, : , 1)))
title('Image set 1, image 1')

subplot(2, 2, 2)
imshow(uint8(stacks{1}(:, : , 100)))
title('Image set 1, image 100')

subplot(2, 2, 3)
imshow(uint8(stacks{1}(:, : , 200)))
title('Image set 1, image 200')

subplot(2, 2, 4)
imshow(uint8(stacks{1}(:, : , 300)))
title('Image set 1, image 300')

% four images from second set
figure

subplot(2, 2, 1)
imshow(uint8(stacks{2}(:, : , 1)))
title('Image set 2, image 1')

subplot(2, 2, 2)
imshow(uint8(stacks{2}(:, : , 100)))
title('Image set 2, image 100')

subplot(2, 2, 3)
imshow(uint8(stacks{2}(:, : , 200)))
title('Image set 2, image 200')

subplot(2, 2, 4)
imshow(uint8(stacks{2}(:, : , 300)))
title('Image set 2, image 300')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Basis 1
figure

subplot(2, 2, 1)
imshow(bases{1}(:, : , 1) * 255)
title('Bases 1, basis matrix 1')

subplot(2, 2, 2)
imshow(bases{1}(:, : , 2) * 255)
title('Bases 1, basis matrix 2')

subplot(2, 2, 3)
imshow(bases{1}(:, : , 3) * 255)
title('Bases 1, basis matrix 3')

subplot(2, 2, 4)
imshow(bases{1}(:, : , 4) * 255)
title('Bases 1, basis matrix 4')

% Basis 2
figure

subplot(2, 2, 1)
imshow(bases{2}(:, : , 1) * 255)
title('Bases 2, basis matrix 1')

subplot(2, 2, 2)
imshow(bases{2}(:, : , 2) * 255)
title('Bases 2, basis matrix 2')

subplot(2, 2, 3)
imshow(bases{2}(:, : , 3) * 255)
title('Bases 2, basis matrix 3')

subplot(2, 2, 4)
imshow(bases{2}(:, : , 4) * 255)
title('Bases 2, basis matrix 4')

% Basis 3
figure
title('Basis 3')

subplot(2, 2, 1)
imshow(bases{3}(:, : , 1) * 255)
title('Bases 3, basis matrix 1')

subplot(2, 2, 2)
imshow(bases{3}(:, : , 2) * 255)
title('Bases 3, basis matrix 2')

subplot(2, 2, 3)
imshow(bases{3}(:, : , 3) * 255)
title('Bases 3, basis matrix 3')

subplot(2, 2, 4)
imshow(bases{3}(:, : , 4) * 255)
title('Bases 3, basis matrix 4')


