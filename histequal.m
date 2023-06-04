function outimg=histequal(inimg)
pkg load image
L=256;
figure;
imshow(inimg);
title('Original Image');
[m,n,l]=size(inimg);
if(l>1)
inimg=rgb2gray(inimg);
figure;
subplot(2,1,1),imshow(inimg)
title('Original Image (Grayscale)');
subplot(2,1,2),imhist(inimg)
end
counts=zeros(256,1);
for i=0:255
counts(i+1)=sum(sum(inimg==i));
end
%calc PDF of the image
p=counts/(m*n);
%s=(L-1)*CDF(p)
s=(L-1)*cumsum(p);
s=round(s);
%Mapping the value of s to corresponding pixels in the image
outimg=uint8(zeros(m,n));
for k=1:size(s,1)
outimg(inimg==k-1)=s(k);
end
figure,
subplot(2,1,1),imshow(outimg);
subplot(2,1,2),imhist(outimg);
end