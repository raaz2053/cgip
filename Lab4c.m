clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
f=imread('cameraman.tif');
f=im2double(f);
w=input('Enter the Neighborhood or Window size : ');
k=input('Enter the value of the constant k (value should be between 0 and 1) : ');
M=mean2(f);
z=colfilt(f,[w w],'sliding',@std);
m=colfilt(f,[w w],'sliding',@mean);
A=k*M./z;
g=A.*(f-m)+m;
subplot(121),imshow(f);
subplot(122), imshow(g);
