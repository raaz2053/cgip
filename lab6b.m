f=imread('demo.png');
subplot(2,2,1);
imshow(f)
title('The original image');
% Gaussian high pass filter
I=double(f);
g=fft2(I);
g=fftshift(g);
[M,N]=size(g); D0=40;
m=fix(M/2);n=fix(N/2);
for i=1:M 
  for j=1:N
    D=sqrt((i-m)^2+(j-n)^2);
    H=exp(-(D.^2)./(2*(D0^2)));
    result(i,j)=(1-H)*g(i,j);
  end 
end 
result=ifftshift(result);
J1=ifft2(result);
J2=uint8(real(J1));
subplot(2,2,2);
imshow(J2);
title('Image after Gaussian high-pass filtering');

%High frequency emphasis filter

F=0.5+0.75*(1-H);
G=F*g;
result2=ifftshift(G);
J3=ifft2(result2);
J4=uint8(real(J3));
subplot(2,2,3);
imshow(J4);
title('High frequency emphasis on filtered image')