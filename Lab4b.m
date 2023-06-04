
clear all; close all;
im1 = rgb2gray(imread('coffee.jpg'));
im2 = rgb2gray(imread('lenna.png'));
out = imhistmatch(im1, im2);
subplot(321),imshow(im1)
subplot(322),imhist(im1)
subplot(321),imshow(im2)
subplot(322),imhist(im2)
subplot(323),imshow(out)
subplot(324),imhist(out)