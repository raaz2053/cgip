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