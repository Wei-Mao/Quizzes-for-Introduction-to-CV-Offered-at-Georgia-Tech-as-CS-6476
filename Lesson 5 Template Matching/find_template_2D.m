clc,clear,close
img = imread('peppers.png');
img = rgb2gray(img);
img = im2double(img);
imshow(img);
template = img(200:300, 100:200);
figure
imshowpair(img, template, 'montage');
[y_index, x_index ] = find_template(img, template)

% visualize the results
figure
colormap('gray'), imagesc(img);
hold on;
% plotting the boudning box
x_index_box = [x_index, x_index + size(template, 2)-1, x_index + size(template, 2)-1, x_index];
y_index_box = [y_index, y_index,y_index + size(template, 1)-1, y_index + size(template, 1)-1, ];
%plot(x_index, y_index, 'r+', 'markersize', 16);
%plot(x_index_box, y_index_box)
for i = 1:3
plot(x_index_box(i:i+1), y_index_box(i:i+1),'r')
hold on
end
plot(x_index_box([4, 1]), y_index_box([4, 1]), 'r')
hold off;


function [y_index, x_index]=find_template(img, tmp)
% returning the starting row and column index of the match
% note matlab do it by full padding, so return the end index
% According the pixel coordinates, y means row , x means column
c = normxcorr2(tmp, img);
[y_index, x_index] = find(c == max(c(:))); 
% remove the offset
y_index = y_index - size(tmp, 1) + 1;   % row
x_index = x_index - size(tmp, 2) + 1;   % column

end