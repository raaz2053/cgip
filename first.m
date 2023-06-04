im1 = rgb2gray(imread('superman.jpg'));
out = histeq(im1);
subplot(221),imshow(im1);
subplot(222),imhist(im1);
subplot(223),imshow(out);
subplot(224),imhist(out);