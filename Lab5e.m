pkg load image
im2 = rgb2gray(imread('moon.png'));
laplacian_filter1 = [0 -1 0; -1 4 -1 ; 0 -1 0];
laplacian_filter2 = [0 1 0; 1 -4 1; 0 1 0];
laplacian_filter3 = [-1 -1 -1 ; -1 8 -1; -1 -1 -1];
laplacian_filter4 = [1 1 1; 1 -8 1 ; 1 1 1];
out1 = imfilter(im2, laplacian_filter1);
out2 = imfilter(im2, laplacian_filter2);
out3 = imfilter(im2, laplacian_filter3);
out4 = imfilter(im2, laplacian_filter4);
subplot(221),imshow(out1,[]);
subplot(222),imshow(out2,[]);
subplot(223),imshow(out3,[]);
subplot(224),imshow(out4,[]);