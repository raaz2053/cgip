img= imread('lenna.png'); 
img_g= rgb2gray(img);
flipped_img= imrotate(img_g,180); 
subplot( 1 , 2 , 1 ) , imshow(img_g); 
subplot( 1 , 2 , 2 ) , imshow(flipped_img);
imwrite (flipped_img,'output1_6.jpeg' )
