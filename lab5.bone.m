
##meanfilter
##pkg load image
##image = rgb2gray(imread('bone.jpg'));
##f = cell(9,1); 
##out = cell(9,1);
##subplot(251),imshow(image);
##for i = 1:9
##f{i} = ones(2*i + 1) /(2*i + 1 )^2 ; 
##out{i} =imfilter(image,f{i});
##subplot(2,5,i+1),imshow(out{i},[]);
##end

#weighted average mean
##
image = rgb2gray(imread('bone.jpg'));
w_filt = [1 2 1 ; 2 4 2 ; 1 2 1 ]/16;
result = imfilter(image,w_filt);
subplot(121),imshow(image);
subplot(122),imshow(result,[]);

##median filter
img1 = rgb2gray(imread('bone.jpg'));
out3 = medfilt2(img1);
subplot(121),imshow(img1);
subplot(122),imshow(out3,[]);

##Laplacian
img2 = rgb2gray(imread('bone.jpg'));
laplacian_filter1 = [0 -1 0; -1 4 -1 ; 0 -1 0];
laplacian_filter2 = [0 1 0; 1 -4 1; 0 1 0];
laplacian_filter3 = [-1 -1 -1 ; -1 8 -1; -1 -1 -1];
laplacian_filter4 = [1 1 1; 1 -8 1 ; 1 1 1];
out1 = imfilter(img2, laplacian_filter1);
out2 = imfilter(img2, laplacian_filter2);
out3 = imfilter(img2, laplacian_filter3);
out4 = imfilter(img2, laplacian_filter4);
subplot(221),imshow(out1,[]);
subplot(222),imshow(out2,[]);
subplot(223),imshow(out3,[]);
subplot(224),imshow(out4,[]);

##gradiant image
img = rgb2gray(imread('bone.jpg'));

[gmag, gphase] = imgradient(img);
subplot(121),imshow(gmag,[]);
subplot(122),imshow(gphase,[]);