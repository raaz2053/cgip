pkg load image
function out = myfft2(im, dim1, dim2, logflag)

if nargin == 1
logflag = 1;
[dim1, dim2] = size(im);
elseif nargin == 2
logflag = dim1;
[dim1, dim2] = size(im);
elseif nargin == 3
logflag = 1;
end
if logflag
out = fftshift(log(abs(fft2(double(im),dim1,dim2))));
else
out = fftshift(abs(fft2(double(im),dim1,dim2)));
end
imshow(out,[]);
end
function fftshow(f,type)
% Usage: FFTSHOW(F,TYPE)
%
% Displays the fft matrix F using imshow, where TYPE must be one of
% 'abs' or 'log'. If TYPE='abs', then then abs(f) is displayed; if
% TYPE='log' then log(1+abs(f)) is displayed. If TYPE is omitted, then
% 'log' is chosen as a default.
%
% Example:
% c=imread('cameraman.tif');
% cf=fftshift(fft2(c));
% fftshow(cf,'abs')
%
if nargin<2,
type='log';
end
if(type=='log')
fl = log(1+abs(f));
fm = max(fl(:));
imshow(im2uint8(fl/fm))
elseif (type=='abs')fa=abs(f);
fm=max(fa(:));
imshow(fa/fm)
else
error('TYPE must be abs or log.');
end
end
function [out, mask] = freqFlt(im, edges, type);
% edges is the boundary value for the filter
% type 'lp' for lowpass filter
% 'hp' for highpass filter
% 'gausslp' for gaussian low pass filter
% 'gausshp' for gaussian high pass filter
% 'laplacian' for laplace high pass filter
% 'btwlp' for butterworth low pass filter
% 'btwhp' for butterworth highpass filter
%
if nargin < 3
type = 'lp';
end
im = double(im);
mask = zeros(size(im));
[M,N] = size(im);
rM = round(M/2) + 1;
rN = round(N/2) + 1;
if length(edges)< 2
[x,y] = meshgrid(1:size(im,1),1:size(im,2));
ind = ((x-rM).^2+(y-rN).^2 < edges ^2);
mask(ind) =1;
d0 = edges;
dist = sqrt((x-rM).^2 + (y-rN).^2);
else
mask(rM-edges(1): rM+edges(1), rN-edges(2): rN + edges(2)) = 1;
end
mask = fftshift(mask); % lowpass filter ideal
if strcmp(type,'hp') %highpass filter ideal
mask = ~mask;
end
if strcmp(type,'btwlp') %butterworth low pass filter
n = input('Enter the order of filter'); % order of butterworth filter
mask = fftshift(1./(1+(dist/d0).^(2*n)));
end
if strcmp(type,'btwhp') % butterworth high pass filter
n = input('Enter the order of filter');
mask = fftshift(1./(1+(d0 ./dist ).^(2*n)));
end
if strcmp(type, 'gausslp') %Gaussian low pass filter
mask = fftshift(exp(-dist.^2/(2*d0^2)));
end

if strcmp(type, 'gausshp') %Gaussian high pass filter
mask = fftshift(1 - exp(-dist.^2/(2*d0^2)));
end
if strcmp(type,'laplacian') %Laplacian high pass filter
mask = fftshift(-4*pi^2 * ((x-rM).^2 + (y-rN).^2));
end

subplot(231),imshow(im,[0,255]),title('Original image');
ft = fft2(im);
subplot(232),fftshow(fftshift(ft)),title('Original FFT');
subplot(233),fftshow(fftshift(mask)),title('Mask');
ft_out = mask.*fft2(im);
subplot(234),fftshow(fftshift(ft_out)),title('Output FFT');
out = real(ifft2(ft_out));
subplot(235),imshow(out,[]),title('Filtered Image');
subplot(236),imshow(fftshift(log(abs(ifft2(mask)))),[]);
title('Spatial Filter corresponding to mask')
figure;
subplot(121),
surf(fftshift((mask)),'edgecolor','none');
title('Frequency filter as surface')
subplot(122),
surf(fftshift(log(abs(ifft2(mask)))),'edgecolor','none');
title('Spatial filter surface corresponding to mask')
end

im = rgb2gray(imread('test_1.png'));

[r mask]= freqFlt(im,50,'btwlp');