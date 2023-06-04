img=imread('Lenna.png');
noise=100*randn(512);
result=img+noise;
subplot(1,2,1), imshow(img)
subplot(1,2,2), imshow(result)
imwrite (result,'output2_6.jpeg' );