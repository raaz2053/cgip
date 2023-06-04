im1 = rgb2gray(imread('shiva.jpg'));
im2= imread('Lenna.png');
out = imhistmatch(im1, im2);
subplot(321),imshow(im1);
subplot(322),imhist(im1);
subplot(321),imshow(im1);
subplot(322),imhist(im1);
subplot(323),imshow(out);
subplot(324),imhist(out);