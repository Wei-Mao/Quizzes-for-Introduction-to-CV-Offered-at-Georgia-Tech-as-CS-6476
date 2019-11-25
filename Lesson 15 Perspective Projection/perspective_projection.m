% Project a point from 3D to 2D using a matrix operation
clc,clear,close all
p_3d = [200, 100,10];
f = 100;
p_img = project_point(p_3d, f)


function p_img = project_point(p, f)
%% Input: Point p in 3D real world [x, y ,z] and focal length f(all in m)
%% Return: Location of the projected point on 2D image plane [x' y'] = p_img
% Tranform the Euclidian Coordiantes to Homogenous Coordinates
p = p(:);  % reshap to column vector
p_h = [p; 1];  % Conver the Euclidian to Homogeneous 

% Define the pojection Matrix
A = [f 0 0 0;
     0 f 0 0;
     0 0 1 0;];
p_img_h = A * p_h;

% Divide the firt 2 coordiantes by the third coordinate
p_img = p_img_h(1:2) / p_img_h(3);

end