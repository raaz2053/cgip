img=imread('lenna.png');
[row,col,l]=size(img);
for i=1:1:row
  k=1;
for j=col:-1:1
temp=img(i,k,:);
result(i,k,:)=img(i,j,:);
result(i,j,:)=temp;
     k=k+1;
endfor
endfor
subplot(1,2,1), imshow(img)
subplot(1,2,2), imshow(uint8(result))
imwrite (result,'output3_6.jpeg' );
