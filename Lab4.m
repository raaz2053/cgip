##img=imread('tyson.jpg');
##subplot(211),imshow(img);
##subplot(212),imhist(img)

##Use the histogram processing methods on images of your choice and discuss the results. Use 3 images, one over-exposed, one under-exposed and one normal image.
##
##img1=imread('demo.png');
##over=img1 + 200;
##under= img1 -100;
##subplot(321),imshow(img1);
##subplot(322),imhist(img1);
##subplot(323),imshow(over);
##subplot(324),imhist(over);
##subplot(325),imshow(under);
##subplot(326),imhist(under);


##Perform histogram equalization on two images of your choice. Compare the resulting histograms. What will happen if the equalized image is applied histogram equalization for the second time?
##clear all;
##close all;

##pkg load image;
##img2 = rgb2gray(imread('demo.png'));
##out1 = histeq(img2);
##out2 = histeq(out1);
##subplot(321),imshow(img2),title('Piyush Manandhar Roll 25')
##subplot(322),imhist(img2)
##subplot(323),imshow(out1),title('Histogram Equalization')
##subplot(324),imhist(out1)
##subplot(325),imshow(out2),title('Histogram Equalization of an Already Equalized Image')
##subplot(326),imhist(out2)


##Apply histogram matching to any two images taking ‘lenna.png’ as the reference image. Evaluate the resulting histograms.
##clear all;
##close all;

##pkg load image;
##img1 = imread('demo.png');
##img2= imread('lenna.png');
##out = imhistmatch(img1,img2);
##subplot(321),imshow(img1);
##subplot(322),imhist(img1);
##subplot(321),imshow(img1);
##subplot(322),imhist(img1);
##subplot(323),imshow(out);
##subplot(324),imhist(out);


##Apply local histogram processing(equalization) to an image. What is the effect of window size on the results? Compare the result with global histogram equalization.
##pkg load image;
##f=imread('demo.png');
##f=im2double(f);
##w=input('Enter the Neighborhood or Window size : ');
##k=input('Enter the value of the constant k (value should be between 0 and 1) : ');
##M=mean2(f);
##z=colfilt(f,[w w],'sliding',@std);
##m=colfilt(f,[w w],'sliding',@mean);
##A=k*M./z;
##g=A.*(f-m)+m;
##subplot(221), imshow(f), title('Piyush Manandhar Roll 25');
##subplot(222), imhist(f);
##subplot(223), imshow(g), title('Window Size: 4 & Constant K: 0.75');
##subplot(224), imhist(g);
