x = imread('Lenna.png');
x= rgb2gray(x);
subplot(241);
imshow(x);
[r,c,s] = size(x);
m = max(x(:));
b = [8 6 8 4 2 7 0];
for i = 1 : length(b)
d = 2^b(i);
z = round(x/d);
subplot(2,4,i+1)
imshow(z * d);
end
########################################################################
########################################################################
########################################################################
x = imread('Lenna.png');
[r,c,s] = size(x);
N = [20];
for i = 1: length(N)
y = zeros(size(x));
y(1:N(i):r,1:N(i):c,:) = x(1:N(i):r,1:N(i):c,:);
figure,
subplot(121),imshow(uint8(y)),title(["Sampled at " num2str(N(i)), "intervals"])
z = y(1:N(i):r,1:N(i):c,:);
subplot(122),
imshow(uint8(z)), title("Image from samples")
end
########################################################################
########################################################################
########################################################################
img = imread('Test.jpg');
result = 255 - img;
subplot(121),imshow(img);
subplot(122),imshow(result);
########################################################################
########################################################################
########################################################################
img1 = imread('Test2.jpg');
res1 = log(1 + img1);
subplot(121),imshow(img1)
subplot(122),imshow(res1)
########################################################################
########################################################################
########################################################################
pkg load image;
img = rgb2gray(imread('Test3.jpg'));
subplot(211),imshow(img)
subplot(212),imhist(img)
########################################################################
########################################################################
########################################################################
img = rgb2gray(imread('Test3.jpg'));
[row col] = size(img);
imhist(img)
t = input('Enter the thresholding value ');
for x = 1:1:row
  for y = 1:1:col
    if img(x,y) >= t
      result(x,y)= 255;
    else
      result(x,y) = 0;
    end
  end
end
imshow(result,[]);
########################################################################
########################################################################
########################################################################
gammaValue = input('Enter the Gamma value, gamma = ');
img = imread('Test3.jpg');
img=rgb2gray(img);
img = double(img);
correction = 255 * (img/255).^gammaValue;
subplot(121),imshow(img, []), title('Original image');
subplot(122),imshow(correction, []), title(['Corrected image, with Gamma = ',num2str(gammaValue)]);
########################################################################
########################################################################
########################################################################
im = rgb2gray(imread('baby.jpg'));
[row col] = size(im);
%H = max(im(:))
H = prctile(im(:),95)
%L = min(im(:))
L = prctile(im(:),1)
m = 255/(H-L);
res = m * (im - L);
subplot(121),imshow(im,[])
subplot(122),imshow(res,[])
o_Max = max(res(:))
o_Min = min(res(:))
########################################################################
########################################################################
########################################################################
clear
pkg load image;
img = imread('apple.jpeg');
[row col] = size(img);
for x = 1:row
for y = 1:col
if(img(x,y) > 150 && img(x,y) < 200 )
out(x,y) = 255;
else
out(x,y) = img(x,y);
end
end
end
subplot(121),imshow(img),title('input image');
subplot(122),imshow(out),title('output image');

########################################################################
########################################################################
########################################################################
pkg load image;
img = imread('nepali_dollar.jpg');
[row col test] = size(img);
if test > 2
img = rgb2gray(img);
end
subplot(3,3,1),imshow(img);
img = double(img);
bl = cell(7,1);
for i= 0 : 7
bl{i+1} = bitget(img,i+1);
subplot(3,3,i+2),imshow(logical(bl{i+1}));
end
########################################################################
########################################################################
########################################################################




