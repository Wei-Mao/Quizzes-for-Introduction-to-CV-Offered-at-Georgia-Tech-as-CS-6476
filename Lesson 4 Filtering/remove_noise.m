% Remove noise with a Gaussian Filter
clc,clear,close all
%% Load an image
img = imread('saturn.png');
img = im2double(img);
figure
imshow(img)

%% Add some noise
noise_sigma = 0.3;  % 1 D dimensional Normally 
noise = randn(size(img)).* noise_sigma;
noisy_img = img + noise;
figure
imshow(noisy_img)

%% Create a Gaussian Filter
filter_size = 60;
filter_sigma = 0.3; % note the inverse scale relation between gaussian and its fourier transform
gaussian_filter = fspecial('gaussian', filter_size, filter_sigma);
denoised_img = imfilter(noisy_img, gaussian_filter);
figure
fig_denoi=imshow(denoised_img)
title('denoised')