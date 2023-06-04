#Test 1
clear all
i=imread('lenna.png');
udi= flipud(i);
udi(90,130)=28;
imwrite(udi,'Lab2c_28.jpeg');


#Test 2
clear all
i=imread('lenna.png');  
r=i(:,:,1); 
g=i(:,:,2); 
b=i(:,:,3); 
i1=.299*r+.587*g+.114*b; 
f1=i1(end:-1:1,end:-1:1); 
subplot(1,2,1), imshow(i)
subplot(1,2,2), imshow(f1) 
imwrite (f1,'Lab2c_28(1).jpeg' );



