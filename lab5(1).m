##1
im = rgb2gray(imread('one.png'));
f = cell(9,1); % 9 filters
out = cell(9,1);
subplot(251),imshow(im);
for i = 1:9
f{i} = ones(2*i + 1) /(2*i + 1 )^2 ; %creating 9 filter matrices
out{i} = imfilter(im,f{i}); %applying filter to input image
subplot(2,5,i+1),imshow(out{i}, []);
end

##2
pkg load image
im = imread('one.png');
w_filt = [1 2 1 ; 2 4 2 ; 1 2 1 ]/16;
result = imfilter(im,w_filt);
subplot(121),imshow(im);
subplot(122),imshow(result,[])

##3
pkg load image
A=imread('two.gif');
%title('IMAGE WITH SALT AND PEPPER NOISE');
subplot(121),imshow(A);
%PAD THE MATRIX WITH ZEROS ON ALL SIDES
modifyA=zeros(size(A)+2);
B=zeros(size(A));
%COPY THE ORIGINAL IMAGE MATRIX TO THE PADDED MATRIX
for x=1:size(A,1)
for y=1:size(A,2)
modifyA(x+1,y+1)=A(x,y);
end
end
%LET THE WINDOW BE AN ARRAY
%STORE THE 3-by-3 NEIGHBOUR VALUES IN THE ARRAY
%SORT AND FIND THE MIDDLE ELEMENT
for i= 1:size(modifyA,1)-2
for j=1:size(modifyA,2)-2
window=zeros(9,1);
inc=1;
for x=1:3
for y=1:3
window(inc)=modifyA(i+x-1,j+y-1);
inc=inc+1;
end
end
med=sort(window);
%PLACE THE MEDIAN ELEMENT IN THE OUTPUT MATRIX
B(i,j)=med(5);
end
end
%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=uint8(B);
%title('IMAGE AFTER MEDIAN FILTERING');
subplot(122),imshow(B);

##4
im1 = imread('two.gif');
out3 = medfilt2(im1);
subplot(121),imshow(im1);
subplot(122),imshow(out3,[]);

##5
im2 = imread('three.jpg');
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

##6
im2 = imread('three.jpg');
out3 = imfilter(im2, laplacian_filter3);
sharp_filt = [0 -1 0;-1 5 -1;0 -1 0];
res1 = imfilter(im2,sharp_filt);
res2 = im2 + uint8(out3); %applying edge-mask in the
image
subplot(121),imshow(res1);
subplot(122),imshow(res2);

##7
im3 = rgb2gray(imread('four.png'));
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

##8
img = rgb2gray(imread('five.jpg'));
[gmag, gphase] = imgradient(img);
subplot(121),imshow(gmag,[]);
subplot(122),imshow(gphase,[]);

##9
img = rgb2gray(imread('five.jpg'));
sobel_gx = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_gy = [-1 0 1; -2 0 2 ; -1 0 1];
Gx = imfilter(img,sobel_gx);
Gy = imfilter(img,sobel_gy);
Gmag = sqrt(double(Gx).^2 + double(Gy).^2);
subplot(121),imshow(img);
subplot(122),imshow(Gmag,[]);

##Asg
img = imread('bone.jpg');
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
figure,subplot(331),imshow(img,[]);
subplot(332),imshow(img1,[]);
subplot(333),imshow(img2,[]);
subplot(334),imshow(img3,[]);
subplot(335),imshow(img4,[]);
subplot(336),imshow(img5,[]);
subplot(337),imshow(img6,[]);
subplot(338),imshow(img7,[]);
