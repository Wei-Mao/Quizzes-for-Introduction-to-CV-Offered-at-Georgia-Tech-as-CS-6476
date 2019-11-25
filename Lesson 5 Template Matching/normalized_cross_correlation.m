clc,clear,close all
%% Read the images
% Note rgb image is read as a 3-D array
% In order to simple manipulation, convert it to gray image 
onion = rgb2gray(imread('onion.png'));
onion = im2double(onion);
peppers = rgb2gray(imread('peppers.png'));
peppers = im2double(peppers);
imshowpair(peppers, onion,'montage');

%% Apply the normalized cross-correlation 
c = normxcorr2(onion, peppers);
figure
surf(c);
shading flat;