clearvars;
src=imread('office.jpg');
img=rgb2gray(src);
[height,width]=size(img);
figure;
subplot(2,2,1),imshow(img),title('original');

% ��ʼֵ
High=2;
Low=0.25;
C=1;
D0=1000;

% �����任
img1=double(img);
img1=log(img1+1);

% ����Ҷ�任
img2=fft2(img1);

% ̬ͬ�˲��ͷ�����Ҷ�任
H=HomoFilter(High,Low,C,D0,height,width);
img3=ifft2(H.*img2);

% ָ���任
img3=real(exp(img3));

subplot(2,2,2),imshow(normalize(img3)),title('̬ͬ�˲�(D0=1000)');

% butterworth��ͨ�˲�
img1=Centralize(img);
img2=fft2(img1);
H=BHPF(1,height,width);
img3=real(ifft2(H.*img2));
img3=Centralize(img3);
subplot(2,2,3),imshow(uint8(img3)),title('BHPF(D0=1)');

