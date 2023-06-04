pkg load image
im = imread('albert.jpg');
f = cell(9,1); % 9 filters
out = cell(9,1);
subplot(251),imshow(im);
for i = 1:9
f{i} = ones(2*i + 1) /(2*i + 1 )^2 ; %creating 9 filter matrices
out{i} = imfilter(im,f{i}); %applying filter to input image
subplot(2,5,i+1),imshow(out{i}, [])
end