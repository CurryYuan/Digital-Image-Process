clearvars;
src=imread('barb.png');
[height,width]=size(src);

% 中心化
img1=Centralize(src);

% 傅里叶变换
img2=fft2(img1);

% 滤波和反傅里叶变换
H=BLPF(10,height,width);
img3=real(ifft2(H.*img2));

% 反中心化
img4=Centralize(img3);

figure;
subplot(2,2,1),imshow(uint8(img4)),title("D0=10");

% 滤波和反傅里叶变换
H=BLPF(20,height,width);
img3=real(ifft2(H.*img2));

% 反中心化
img4=Centralize(img3);
subplot(2,2,2),imshow(uint8(img4)),title("D0=20");

% 滤波和反傅里叶变换
H=BLPF(40,height,width);
img3=real(ifft2(H.*img2));

% 反中心化
img4=Centralize(img3);
subplot(2,2,3),imshow(uint8(img4)),title("D0=40");

% 滤波和反傅里叶变换
H=BLPF(80,height,width);
img3=real(ifft2(H.*img2));

% 反中心化
img4=Centralize(img3);
subplot(2,2,4),imshow(uint8(img4)),title("D0=80");

