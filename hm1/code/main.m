%直方图均衡化
I=imread('river.jpg');

figure
subplot(3,2,1),imshow(I),title('原图像');
subplot(3,2,2),imhist(I),title('直方图');

I=myHisteq(I);

subplot(3,2,3),imshow(I),title('myHisteq');
subplot(3,2,4),imhist(I),title('直方图');

I=histeq(I);    %matlab函数
subplot(3,2,5),imshow(I),title('histeq');
subplot(3,2,6),imhist(I),title('直方图');  

