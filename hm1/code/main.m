%ֱ��ͼ���⻯
I=imread('river.jpg');

figure
subplot(3,2,1),imshow(I),title('ԭͼ��');
subplot(3,2,2),imhist(I),title('ֱ��ͼ');

I=myHisteq(I);

subplot(3,2,3),imshow(I),title('myHisteq');
subplot(3,2,4),imhist(I),title('ֱ��ͼ');

I=histeq(I);    %matlab����
subplot(3,2,5),imshow(I),title('histeq');
subplot(3,2,6),imhist(I),title('ֱ��ͼ');  

