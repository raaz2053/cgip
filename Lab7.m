#Q1:
pkg load image;
img=rgb2gray(imread('six.jpg'));
subplot(221),imshow(img),title('original-image');
img_gaussian=imnoise(img,'gaussian');
subplot(222),imshow(img_gaussian),title('gaussian-noiseimg');
subplot(223),imhist(img),title('original-hist');
subplot(224),imhist(img_gaussian),title('gaussian-noisehist');


#Q2:
pkg load image
im = imread('six.jpg');
[M N] = size(im);
rM = round(M/2) + 1;
rN = round(N/2) + 1;
mask = zeros(size(im));
[x y] = meshgrid(1:size(im,1), 1:size(im,2));
dist = sqrt((x-rM).^2 + (y-rN).^2);
d0 = 180;
n = 2;
W = 70;
##for butterworth
mask = 1 ./ (1 + ((dist*W)./(dist.^2 - d0^2)).^2);
## for gaussian
##mask= 1 - exp(-((dist.^2 - d0^2)./(dist.*W + eps)).^2);
##for ideal
##RI = dist <= d0 - (W/2);
##RO = dist >= d0 + (W/2);
##mask= RO | RI;
flt_im = mask' .* fftshift(fft2(im));
output = abs(ifft2(flt_im));
subplot(131),imshow(im),title("original image")
subplot(132),imshow(mask),title("mask")
subplot(133),imshow(output,[]),title("output")


#Q3:
pkg load image
im=double(imread('star.png'));
imft=fft2(im);
figure,imshow(log(fftshift((abs(imft)))),[]);
[b, a]=ginput();
mask=zeros(size(im));
edges=20;
n=2;
[x,y]=meshgrid(1:size(im,1),1:size(im,2));
d0=edges;
nmask=ones(size(im));
dist=ones(1,length(a));
for i=1:length(a)
 dist=(sqrt((x-a(i)).^2+(y-b(i)).^(2)))';
 mask=(1./(1+(d0./dist).^(2*n)));
 nmask=nmask.*mask;
end
subplot(231),imshow(im,[0,255]),title('original image');
subplot(232),fftshow(fftshift(imft)),title('original fft');
subplot(233),fftshow((nmask)),title('mask');
ft_out=nmask.*(fftshift(imft));
subplot(234),fftshow(ft_out),title('output fft');
out=abs(ifft2(ft_out));
subplot(235),imshow(out,[]),title('filtered image');
subplot(236),imshow(fftshift(log(abs(ifft2(nmask)))));
title('spatial filter corresponding to mask');