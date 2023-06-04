pkg load image

f=imread('coffee.jpg');
f=im2double(f);
h=rgb2gray(imread('coffee.jpg'));
hist = histeq(h);
w=input('Enter the Neighborhood or Window size : ');
k=input('Enter the value of the constant k (value should be between 0 and 1) : ');
M=mean2(f);
z=colfilt(f,[w w],'sliding',@std);
m=colfilt(f,[w w],'sliding',@mean);
A=k*M./z;
g=A.*(f-m)+m;
subplot(321), imshow(f)
subplot(322), imhist(f)
subplot(323), imshow(g)
subplot(324), imhist(g)
subplot(325), imshow(f)
subplot(326), imhist(hist)