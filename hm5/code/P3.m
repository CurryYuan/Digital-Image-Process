close all; 
clear;  
clc;  

I=imread('blobz2.png');  
subplot(1,2,1);  
imshow(I);  
title('原图');  

[m,n]=size(I);
x=26;
m1=floor(m/x);
n1=floor(n/x);
for i=1:m1
    for j=1:n1
        H(i*x-x+1:i*x,j*x-x+1:j*x)=threshold(I(i*x-x+1:i*x,j*x-x+1:j*x));
    end
    H(i*x-x+1:i*x,n1*x:n)=threshold(I(i*x-x+1:i*x,n1*x:n));
end
for j=1:n1
    H(m1*x:m,j*x-x+1:j*x)=threshold(I(m1*x:m,j*x-x+1:j*x));
end
H(m1*x:m,j*x:n)=threshold(I(m1*x:m,j*x:n));
 
subplot(1,2,2),imshow(H),title('二值化');