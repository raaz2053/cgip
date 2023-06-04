#Test 1
clear all
img = imread('lenna.png'); % Reads image from the working directory
noise = 100 * randn(512); % Generates 512 x 512 matrix of random numbers
result = img + noise; % Adds noise to the image
result(90,130)=28;
imwrite(result,'Lab2a_28.jpeg')
subplot ( 1 , 2 , 1 ) , imshow ( img )
subplot ( 1 , 2 , 2 ) , imshow ( result )


