pkg load image
im = imread('test.png');
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