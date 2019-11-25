clc,clear,close all
img = imread('lena512color.tiff');
img = rgb2gray(img); 
img = im2double(img);  % normalized to range [0,1] , cast type to double
figure
imshow(img , []);
img_edge = edge(img, 'canny');  % 0.001 is the sigma of gaussian
figure
imshow(img_edge);