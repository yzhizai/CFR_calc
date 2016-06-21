clear all
close all
h1 = figure(1);
A = checkerboard(4);
imshow(A)
h2 = figure(2);
B = imresize(A,4);
imshow(B)