clc,clear,close all
img = imread('lena512color.tiff');
img = rgb2gray(img); 
%img = im2double(img);  % normalized to range [0,1] , cast type to double
img = double(img);
figure
imshow(img , []);

% edge dectection by magnitude
gauss_filter = fspecial('gaussian', [64 64], 0.1);
sobel_filter = fspecial('sobel'); % y direction
%filtered_gauss = img;
filtered_gauss = imfilter(img, gauss_filter);
figure 
imshow(filtered_gauss,[])
filtered_sobel_y = imfilter(filtered_gauss, 1/ 8 * sobel_filter);
filtered_sobel_x = imfilter(filtered_gauss, 1/ 8 * sobel_filter');
% magnitude of gradient
gmag_img = sqrt(filtered_sobel_x.^2 + filtered_sobel_y.^2);
figure
imshow(gmag_img, []);
% Thersholding the gradient
gmag_img(gmag_img<0.3 * max(gmag_img(:))) = 0;
figure
imshow(gmag_img, []);