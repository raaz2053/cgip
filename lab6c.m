pkg load image
function g = homo_filter(f,D0,gamaH,gamaL)
    [M,N]=size(f);
    u=0:(M-1);
    v=0:(N-1);
    idx=find(u>M/2);
    u(idx)=u(idx)-M;
    idy=find(v>N/2);
    v(idy)=v(idy)-N;
    [V,U]=meshgrid(v,u);
    D=sqrt(U.^2+V.^2);
    H = 1 - exp(-(D.^2)./(2*(D0^2)));
   
   % Gaussian High-pass Filter 
   
   H = (gamaH - gamaL)*H + gamaL;
   z = log2(1+double(f));
   Z = fft2(z);
   S=H.*Z;
   s=real(ifft2(double(S)));
   g = 2.^s;
   subplot(1,2,1);
   imshow(f);
   title('Input image');
   subplot(1,2,2);
   imshow(g,[ ]);
   title('Enhanced image');
end
f=rgb2gray(imread('demo.png'));
g=homo_filter(f,0.25,2,1,80)