pkg load image
im1 = imread('noise.png');
out3 = medfilt2(im1);
subplot(121),imshow(im1);
subplot(122),imshow(out3,[]);