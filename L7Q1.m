pkg load image;
img=rgb2gray(imread('fav.jpg'));
subplot(221),imshow(img),title('original-image');
img_gaussian=imnoise(img,'gaussian');
subplot(222),imshow(img_gaussian),title('gaussian-noiseimg');
subplot(223),imhist(img),title('original-hist');
subplot(224),imhist(img_gaussian),title('gaussian-noisehist');
