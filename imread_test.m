clear; close all
I = imread('board.tif');
J = rgb2gray(I);
figure, imshow(I), figure, imshow(J);
