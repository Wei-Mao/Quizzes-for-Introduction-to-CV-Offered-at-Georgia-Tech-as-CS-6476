clc,clear,close
img = imread('peppers.png');
img = rgb2gray(img);
img = im2double(img);  % double and normalize pixel value to range 0 to 1,in order fulfil the default of imshow 
figure
imshow(img);  % imshow assume the pixel range 0 to 1, 
figure
surf(img,'EdgeColor', 'none' );