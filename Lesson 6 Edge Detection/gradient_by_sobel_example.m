% clc,clear,close all
img = imread('peppers.png');
img = rgb2gray(img);
%img = im2double(img);  % Keep in mind to normalize and 
sobel_filter = fspecial('sobel');  % by default y direction!
disp(sobel_filter)
filtered_y = imfilter(double(img), sobel_filter);  % it is better double not im2double!
figure
imagesc(filtered_y);
colormap gray;
filtered_x = imfilter(double(img), sobel_filter');  % transpose to get x direction
figure
imagesc(filtered_x);
colormap gray;
g_mag = sqrt(filtered_x.^2 + filtered_y.^2);
figure
g_angle = atan2(filtered_y, filtered_x);

imshowpair(g_mag, g_angle,'montage');

% The pixel with large magnitude of gradient is more likely to conforms to
% the edge!
% If only one edge, we should find the peak!