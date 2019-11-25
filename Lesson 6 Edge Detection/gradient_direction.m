clc,clear,close all
img = imread('circle.jpg');
img = rgb2gray(img);
%imshow(img, []);%imagesc(img)
img = double(img); % convert uint8 to double
img = img/255; % or img =  im2double(imread('octagon.png'))
figure
imshow(img, []);   % assume [0,1]  range for double image

% compute x, y  gradients
[gx, gy] = imgradientxy(img, 'sobel'); % by default no 1/8 

% Obtain gradient magnitude
[gmag, gdir] = imgradient(gx, gy);  % gdir [-180,180 degrees] 
figure
imshow((gdir + 180.0) / 360.0);

% Find pixels with desired gradient direction
my_grad = select_gdir(gmag, gdir, 1, 0, 10);
figure
imshow(my_grad,[]);

function result = select_gdir(gmag, gdir, mag_min, angle_low, angle_high)
% 
result = gmag >= mag_min & gdir >= angle_low & gdir <= angle_high;
end