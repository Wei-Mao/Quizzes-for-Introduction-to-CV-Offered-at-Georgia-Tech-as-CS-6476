clc,clear,close all
img = imread('panda.jpg');
img = rgb2gray(img);
img = im2double(img);
figure
imshow(img, [])
fsize = 64;
for sigma = linspace(1,10 ,3)
    gauss_filter = fspecial('gaussian', fsize, sigma);
    solbe_filter = fspecial('sobel');
    filtered_gaussian = imfilter(img, gauss_filter); % by default, correlation
    filtered_der_y = imfilter(filtered_gaussian, 1/8 * solbe_filter);
    filtered_der_x = imfilter(filtered_gaussian, 1/8 * solbe_filter');
    figure
    imshow(sqrt(filtered_der_x.^2 + filtered_der_y.^2))
end