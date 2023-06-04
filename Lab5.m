##pkg load image
##
##img = rgb2gray(imread('fracture.jpg'));
##f = cell(9,1);
##out = cell(9,1);
##subplot(251), imshow(img);
##for i = 1:9
##  f{i} = ones(2*i + 1)/ (22*i + 1)^2;
##  out{i} = imfilter(img, f{i});
##  subplot(2,5,i+1), imshow(out{i},[]);
## endfor
 

##pkg load image 
##clear all;
##close all; 
##img = rgb2gray(imread('fracture.jpg'));
##w_filt = [1 2 1 ; 2 4 2 ; 1 2 1 ]/16;
##result = imfilter(img,w_filt);
##subplot(121),imshow(img);
##subplot(122),imshow(result,[]);


##pkg load image 
##clear all;
##close all; 
##img = rgb2gray(imread('fracture.jpg'));
##out3 = medfilt2(img);
##subplot(121),imshow(img), title('Piyush Manandhar Roll 25');
##subplot(122),imshow(out3,[]);


##pkg load image 
##clear all;
##close all; 
##img = rgb2gray(imread('fracture.jpg'));
##sharp_filter = [0 -1 0; -1 5 -1; 0 -1 0];
##out = imfilter(img,sharp_filter);
##subplot(121),imshow(img), title('Piyush Manandhar Roll 25');
##subplot(122),imshow(out);


##pkg load image 
##clear all;
##close all; 
##img = rgb2gray(imread('fracture.jpg'));
##[gmag, gphase] = imgradient(img);
##subplot(212),imshow(img,[]),title('Original Image');
##subplot(221),imshow(gmag,[]),title('Magnitude');
##subplot(222),imshow(gphase,[]), title('Phase')

