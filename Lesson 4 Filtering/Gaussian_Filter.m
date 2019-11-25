clc,clear,close
im = imread('peppers.png');
im = im2double(im);
hsize = 31;  % 31 by 31
sigma = 5;   % standard deviation
h = fspecial('gaussian', hsize, sigma);  % construct of matrix of size 31 by 31 approximating the gaussian filter
surf(h);
imagesc(h);
out_im = imfilter(im, h);
figure
imshow(out_im);

for sigma = linspace(0.1,10,5)
    h = fspecial('gaussian', hsize, sigma);
    out_im = imfilter(im, h);
    figure
    imshow(out_im)
end
