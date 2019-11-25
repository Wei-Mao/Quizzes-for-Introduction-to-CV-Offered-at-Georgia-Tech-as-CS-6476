clc, clear, close all
% Load the image, convert to int and normalize to [0, 1]
img = imread('blood-cells.png');
img = im2double(img);
figure, imshow(img, []), title('Orginal Image');

% Calculate the integral image
I = compute_integral(img);
figure, imshow(I, []), title('Integral Image'); % or imshow(I/ I(end, end))

% Compare sum over an image window
y1 = 150;
x1 = 100;
y2 = 350;
x2 = 200;

disp(sum(sum(img(x1:x2, y1:y2)))); % including edge
disp(I(x2, y2) - I(x2, y1-1) - I(x1-1, y2) + I(x1-1, y1-1));


function I = compute_integral(img)
% Compute I such that  I(y, x) = sum of img(1, 1) to img(y, x)
[m ,n] = size(img);
I = zeros(m, n);
I(1, 1) = img(1, 1);
for i = 2:m
    I(1, i) = I(1, i-1) + I(1, i);
    I(i, 1) = I(i-1, 1) + I(i, 1);
end

for i = 2:m
    for j = 2:n
        I(i, j) = I(i-1, j) + I(i ,j-1) + img(i ,j ) - I(i-1 ,j - 1);
    end
end
end
