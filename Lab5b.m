pkg load image
im = imread('albert.jpg');
w_filt = [1 2 1 ; 2 4 2 ; 1 2 1 ]/16;
result = imfilter(im,w_filt);
subplot(121),imshow(im);
subplot(122),imshow(result,[])