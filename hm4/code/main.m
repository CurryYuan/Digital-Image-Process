clearvars
img=imread('book_cover.jpg');
[height,width]=size(img);

% 中心化
img1=Centralize(img);

% 傅里叶变换
img2=fft2(img1);

H=myFilter(height,width,1,0.1,0.1);
img3=real(ifft2(H.*img2));

% 反中心化
img3=Centralize(img3);

figure;
%imshow(uint8(img3)),title("motion blur");

img4=GaussianNoise(img3,0,500);
%imshow(normalize(img4)),title("GaussianNoise");

img5 = InverseFilter(img4, H);
%subplot(1, 2, 1),imshow(uint8(img5)),title('with noise');
img6=InverseFilter(img3,H);
%subplot(1, 2, 2),imshow(uint8(img6)),title('without noise');

img7 = WienerFilter(img4, H, 0.015);
subplot(2, 2, 1),imshow(uint8(img5)),title("InverseFilter");
subplot(2, 2, 2),imshow(uint8(img7)),title("WienerFilter with K=0.018");
img8 = WienerFilter(img4, H, 0.01);
subplot(2, 2, 3),imshow(uint8(img8)),title("WienerFilter with K=0.01");
img9 = WienerFilter(img4, H, 0.005);
subplot(2, 2, 4),imshow(uint8(img9)),title("WienerFilter with K=0.008");
% imshow(uint8(img6));
% %title('Wiener Filtered Image');
