#Histogram equalization 1
clear all; close all;
im1 = rgb2gray(imread('coffee.jpg'));
out = histeq(im1);
subplot(221),imshow(im1)
subplot(222),imhist(im1)
subplot(223),imshow(out)
subplot(224),imhist(out)

#Histogram equalization 2
clear all; close all;
im1 = imread('albert.jpg');
out1 = histeq(im1);
subplot(221),imshow(im1)
subplot(222),imhist(im1)
subplot(223),imshow(out)
subplot(224),imhist(out)

#Applying histogram equalization 2 times
clear all; close all;
im1 =rgb2gray(imread('coffee.jpg'));
out1 = histeq(im1);
out2 = histeq(out1);
subplot(221),imshow(out1)
subplot(222),imhist(out1)
subplot(223),imshow(out2)
subplot(224),imhist(out2)