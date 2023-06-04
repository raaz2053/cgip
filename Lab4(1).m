#Q1
im1 = rgb2gray(imread('Overexposed.jpg'));
out = histeq(im1);
subplot(221),imshow(im1);
subplot(222),imhist(im1);
subplot(223),imshow(out);
subplot(224),imhist(out);

#Q1.1
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


#Q2
im1 = rgb2gray(imread('Overexposed.jpg'));
im2= imread('Lenna.png');
out = imhistmatch(im1, im2);
subplot(321),imshow(im1);
subplot(322),imhist(im1);
subplot(321),imshow(im1);
subplot(322),imhist(im1);
subplot(323),imshow(out);
subplot(324),imhist(out);

#Q3
f=imread('Overexposed.jpg');
f=im2double(f);
w=input('Enter the Neighborhood or Window size : ');
k=input('Enter the value of the constant k (value should be between 0 and 1) : ');
M=mean2(f);
z=colfilt(f,[w w],'sliding',@std);
m=colfilt(f,[w w],'sliding',@mean);
A=k*M./z;
g=A.*(f-m)+m;
subplot(121),imshow(f);
subplot(122), imshow(g);