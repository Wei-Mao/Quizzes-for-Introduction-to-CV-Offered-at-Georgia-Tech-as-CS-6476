clc, clear, close all
%% Read the image 
img = imread('moon.tif');
img = im2double(img); % rescale to the interval [0,1] and type casting to double
figure
imshow(img);

%% Add salt & pepper noise
noisy_img = imnoise(img, 'salt & pepper', 0.02);  % break the assumption of zero-mean
figure
imshow(noisy_img);

%% Apply a meadian filter
% note that median filtering is a nonlinear operation
% do not use fspecial and imfilter
median_filtered = medfilt2(noisy_img); % medianfiltering in 2-D 
figure
imshow(median_filtered); 
% As is demonstrated on the figures, the medianfiltering preserves the
% edge!!

