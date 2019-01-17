clearvars;
src=imread('barb.png');
[height,width]=size(src);

% ���Ļ�
img1=Centralize(src);

% ����Ҷ�任
img2=fft2(img1);

% �˲��ͷ�����Ҷ�任
H=BLPF(10,height,width);
img3=real(ifft2(H.*img2));

% �����Ļ�
img4=Centralize(img3);

figure;
subplot(2,2,1),imshow(uint8(img4)),title("D0=10");

% �˲��ͷ�����Ҷ�任
H=BLPF(20,height,width);
img3=real(ifft2(H.*img2));

% �����Ļ�
img4=Centralize(img3);
subplot(2,2,2),imshow(uint8(img4)),title("D0=20");

% �˲��ͷ�����Ҷ�任
H=BLPF(40,height,width);
img3=real(ifft2(H.*img2));

% �����Ļ�
img4=Centralize(img3);
subplot(2,2,3),imshow(uint8(img4)),title("D0=40");

% �˲��ͷ�����Ҷ�任
H=BLPF(80,height,width);
img3=real(ifft2(H.*img2));

% �����Ļ�
img4=Centralize(img3);
subplot(2,2,4),imshow(uint8(img4)),title("D0=80");

