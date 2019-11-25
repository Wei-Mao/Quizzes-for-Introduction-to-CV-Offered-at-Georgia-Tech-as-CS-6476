clc,clear,close all

%% Load the stereo images
left_img = imread('flowers-left.png');
right_img = imread('flowers-right.png');

%% Conver the RGB to grayscale images with double type, and normalize to [0, 1] range
left_gray = double(rgb2gray(left_img)) / 255.0;
right_gray = double(rgb2gray(right_img)) / 255.0;
figure
imshowpair(left_gray, right_gray, 'montage');


%% Define image patch location (topleft [row left]) and size
% But, give the center postion is better! or treat the center of window as
% interest point!
patch_loca = [10, 400];
patch_size = [100 100];


%% Extract the patch from the left image
patch_left = left_gray(patch_loca(1):patch_loca(1) + patch_size(1) - 1, patch_loca(2):patch_loca(2) + patch_size(2) - 1);
figure
imshow(patch_left);

%% Extract the strip from the right image
strip_right = right_gray(patch_loca(1):patch_loca(1) + patch_size(1) - 1,:);
% Note that we assume epipolar lines are at the same height!!!
figure
imshow(strip_right);



%% Seek the patch in the strip from the right image and report the best position
%% denoted by the column index starting from the top-left corner
best_x = find_best_match(patch_left, strip_right);
disp(best_x);
patch_right = strip_right(:, best_x:best_x+ patch_size(2) -1);
figure
imshowpair(patch_left, patch_right,'montage');
function best_x = find_best_match(patch_left, strip_right)
    num_column = size(strip_right, 2);
    % Normalize the
    [patch_size_row, patch_size_col] = size(patch_left);
    best_x = 1;
   % min_diss = inf;
    max_corr = 0;
    %patch_left = (patch_left - mean(patch_left(:))) / std(patch_left(:));
    corr_cache = zeros(num_column-(patch_size_col-1),1);
    for k = 1:num_column-(patch_size_col-1)
       patch_right = strip_right(:, k:k+patch_size_col-1);
      % patch_right = (patch_right - mean(patch_right(:))) / std(patch_right(:));
%        dissimilarity = norm((patch_right(:)- patch_left(:)));
%        if dissimilarity < min_diss
%            min_diss = dissimilarity;
%            best_x = k;
%        end
       % cross_correlation = patch_left(:)' * patch_right(:);
       % cosine similarity!
        cross_correlation = patch_left(:)' * patch_right(:) / (norm(patch_left(:)) * norm(patch_right(:)));
        corr_cache(k) = cross_correlation;
        if cross_correlation > max_corr
            max_corr = cross_correlation;
            best_x = k;
        end
    end
    plot(corr_cache)
end


%% After finishing the sliding window, you can compute the disparity between the two point (difference of the column number)
%% Note that the depth, distance from camera to the object, is inversely proportional to the diparity in the set-up of coplanar image plane
