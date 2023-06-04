pkg load image
img = rgb2gray(imread('landscape.jpg'));
sobel_gx = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_gy = [-1 0 1; -2 0 2 ; -1 0 1];
Gx = imfilter(img,sobel_gx);
Gy = imfilter(img,sobel_gy);
Gmag = sqrt(double(Gx).^2 + double(Gy).^2);
subplot(121),imshow(img);
subplot(122),imshow(Gmag,[]);