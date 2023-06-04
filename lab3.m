#Q1
x = imread('lenna.png');
subplot(221),
imshow(x);
[r,c,s] = size(x);
m = max(x(:));
b = [7 6 5];
for i = 1 : length(b)
d = 2^b(i);
z = round(x/d);
subplot(2,2,i + 1)
f=z*d;
f(100,100)=28;
imshow(f)
end

#Q2
imread('task2.jpeg');
[r,c,s] = size(x);
N = [2,5,10];
for i = 1: length(N)
y = zeros(size(x));
y(1:N(i):r,1:N(i):c,:) = x(1:N(i):r,1:N(i):c,:);
figure,
subplot(121),imshow(uint8(y)),title(["Sampled at " num2str(N(i)),"intervals"])
z = y(1:N(i):r,1:N(i):c,:);
subplot(122),
imshow(uint8(z)), title("Image from samples")

#Q3
i = imread('BTS.jpg');
result = 255 - i;
result(10,10)=28;
subplot(121),imshow(i)
subplot(122),imshow(result)
imwrite(result,'First_32.jpeg');

#Q4
im = imread('DFT_no_log.png');
res1 = log(1 + im);
res1(10,10)=28;
subplot(121),imshow(im)
subplot(122),imshow(res1)
imwrite(res1,"Second_32.jpeg");

#Q5
img = rgb2gray(imread('thresh.jpg'));
subplot(211),imshow(img)
subplot(212),imhist(img)

k=rgb2gray(imread('coins.jpg'));
[row col] = size(k);
t = input('Enter the thresholding value ');
for x = 1:1:row
for y = 1:1:col
if k(x,y) >= t
result(x,y)= 255;
else
result(x,y) = 0;
result(100,100)=28;
end
end
end
imshow(result,[])
imwrite(result,'third_32.jpeg');

#Q6
gammaValue = input('Enter the Gamma value, gamma = ');
img = imread('highexpo.jpg');
img1=rgb2gray(img);
img2 = double(img1);
correction = 255 * (img2/255).^gammaValue;
subplot(121),imshow(img, []), title('Original image');
subplot(122),imshow(correction, []), title(['Corrected image, with Gamma = ' num2str(gammaValue)]);

#Q7
im = rgb2gray(imread('seeds.png'));
[row col] = size(im);
H = prctile(im(:),95)
L = prctile(im(:),1)
m = 255/(H-L);
res = m * (im - L);
res(100,100)=28;
subplot(121),imshow(im,[])
subplot(122),imshow(res,[])
o_Max = max(res(:))
o_Min = min(res(:))
imwrite(res,'fourth_32.jpg');

#Q8
img = imread('spine.jpg');
[row col] = size(img);
for x = 1:row
for y = 1:col
if(img(x,y) > 150 && img(x,y) < 200 )
out(x,y) = 255;
else
out(x,y) = img(x,y);
out(100,100)=28;
end
end
end
subplot(121),imshow(img),title('input image');

subplot(122),imshow(out),title('output image');
imwrite(out,'fifth_32.jpg');

#Q9
img = imread('nepalirs.jpg');
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

re_img = 128* bl{8}+ 64 * bl{7};%%+ 32 * bl{6}+ 16 * bl{5};
subplot(121),imshow(re_img,[]),title('Reconstructed image using 4 planes');
subplot(122),imshow(uint8(img)),title('original');


