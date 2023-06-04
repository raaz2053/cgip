pkg load image
im3 = rgb2gray(imread('canada.jpg'));
filt = ones(5)/25;
blur_im = imfilter(im3,filt);
g_mask = im3 - blur_im;
g = im3 + g_mask;
g_high = im3 + 5 * g_mask;
g_dempha = im3 - 5 * g_mask;
subplot(231),imshow(im3),title('Input');
subplot(232),imshow(blur_im,[]),title('Blurred image');
subplot(233),imshow(g_mask,[]),title('Mask');
subplot(234),imshow(g,[]),title('Unsharp Masked Image');
subplot(235),imshow(g_high,[]),title('High-boost filtering');
subplot(236),imshow(g_dempha,[]),title('Edge demphasis');