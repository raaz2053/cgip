##pkg load image;
##im1 =rgb2gray( imread('over_ex.jpg'));
##out = histeq(im1);
##subplot(221),imshow(im1);
##subplot(222),imhist(im1);
##subplot(223),imshow(out);
##subplot(224),imhist(out);

##pkg load image;
##im1 =imread('under_ex.jpg');
##out = histeq(im1);
##subplot(221),imshow(im1);
##subplot(222),imhist(im1);
##subplot(223),imshow(out);
##subplot(224),imhist(out);
##
##pkg load image;
##im1 =imread('normal_ex.jpg');
##out = histeq(im1);
##subplot(221),imshow(im1);
##subplot(222),imhist(im1);
##subplot(223),imshow(out);
##subplot(224),imhist(out);

#########################################
#########################################
##pkg load image;
##aa=rgb2gray(imread('over_ex.jpg'));
##ref=imread('Lenna.png');
##figure(1); imshow(aa); colormap(gray)
##figure(2); imshow(ref); colormap(gray)
##
##M = zeros(256,1,'uint8'); % Store mapping - Cast to uint8 to respect data type
##hist1 = imhist(aa); % Compute histograms
##hist2 = imhist(ref);
##cdf1 = cumsum(hist1) / numel(aa); % Compute CDFs
##cdf2 = cumsum(hist2) / numel(ref);
##
##% Compute the mapping
##for idx = 1 : 256
##    [~,ind] = min(abs(cdf1(idx) - cdf2));
##    M(idx) = ind-1;
##end
##
##% Now apply the mapping to get first image to make
##% the image look like the distribution of the second image
##out = M(double(aa)+1);
##
##figure(3); imshow(out); colormap(gray)


######################################
######################################
f=rgb2gray(imread('over_ex.jpg'));
f=im2double(f);
w=input('Enter the Neighborhood or Window size : ');
k=input('Enter the value of the constant k (value should be between 0 and 1) : ');
M=mean2(f);
z=colfilt(f,[w w],'sliding',@std);
m=colfilt(f,[w w],'sliding',@mean);
A=k*M./z;
g=A.*(f-m)+m;
subplot(121),imshow(f);
subplot(122), imshow(g);
