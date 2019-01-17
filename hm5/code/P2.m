close all; 
clear;  
clc;  

I=imread('blobz2.png');  
subplot(1,2,1);  
imshow(I);  
title('原图');  

H=threshold(I); 
subplot(1,2,2),imshow(H),title('二值化');