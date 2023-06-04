img=imread('Lenna.png'); 
imshow(img) 
r=img(:,:,1); 
g=img(:,:,2); 
b=img(:,:,3); 
g_img=.299*r+.587*g+.114*b; 
flipped_img=g_img(end:-1:1,end:-1:1); 
imshow(flipped_img) 
imwrite (flipped_img,'output1_6.jpeg' );
