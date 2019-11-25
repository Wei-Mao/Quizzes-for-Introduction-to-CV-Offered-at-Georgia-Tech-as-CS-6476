clc,clear,close all
%% Load the image, convert to grarscale images
img = imread('shapes.png');
figure, imshow(img, []), title('Original Image');
img = rgb2gray(img);
img = im2double(img);
figure, imshow(img, []), title('Grayscale Image');

%% Apply Canny edge dectector to find edge points(feature)
edges = edge(img, 'canny'); % return a binay image with 1's in the position of edge pixel, 0's elsewhere
figure, imshow(edges), title('edges pixels');

%% Apply Hough transform to find the candiate lines
[accum, theta, rho] = hough(edges);  % binary image as an input
figure, imagesc(accum, 'XData', theta, 'YData', rho), title('Hough accumulator');
[peak1, peak2] = houghpeaks(accum, 100);%
%size(peaks)
hold on;
plot(theta(peak2), rho(peak1),'rs');
%% Find lins segments in the image
peaks = [peak1, peak2];
line_segs = houghlines(edges, theta, rho, peaks)