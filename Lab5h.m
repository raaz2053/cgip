pkg load image
img = rgb2gray(imread('landscape.jpg'));
[gmag, gphase] = imgradient(img);
subplot(121),imshow(gmag,[]);
subplot(122),imshow(gphase,[]);