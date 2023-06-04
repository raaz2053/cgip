pkg load image
img = imread('bone.jpeg');

%img = double(img);
lap_filt = fspecial('laplacian', 0); % predefine function to create laplacian function
%second argument ranges from [0 to 1]
img1 = imfilter(double(img),lap_filt); % gives edges
img2 = img + img1; % adding edge to original image
[img3 Gdir] = imgradient(img); % sobel image
h_avg = fspecial('average',5);
img4 = imfilter(img3,h_avg); % sobel image smoothed with a 5 x 5 averaging filter
img5 = double(img2) .* double(img4); %mask formed by img2 and img4
img6 = double(img) + double(img5);
img7 = img6 .^ 0.4;
subplot(241),imshow(img,[]);
subplot(242),imshow(img1,[]);
subplot(243),imshow(img2,[]);
subplot(244),imshow(img3,[]);
subplot(245),imshow(img4,[]);
subplot(246),imshow(img5,[]);
subplot(247),imshow(img6,[]);
subplot(248),imshow(img7,[]);