pkg load image
im2= rgb2gray(imread('moon.png'));
laplacian_filter3 = [-1 -1 -1 ; -1 8 -1; -1 -1 -1];
out3 = imfilter(im2, laplacian_filter3);
sharp_filt = [0 -1 0;-1 5 -1;0 -1 0];
res1 = imfilter(im2,sharp_filt);
res2 = im2 + uint8(out3); %applying edge-mask in the image
subplot(121),imshow(res1);
subplot(122),imshow(res2);