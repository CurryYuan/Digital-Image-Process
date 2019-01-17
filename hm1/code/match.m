%�Ҷ�ͼֱ��ͼƥ��

im=imread('EightAM.png');
hist=imhist(im);
cdf=cumsum(hist)/numel(im);

im1=imread('LENA.png');
hist1=imhist(im1);
cdf1=cumsum(hist1)/numel(im1);

%ƥ��
M = zeros(256,1);
for i=1:256
    [~,index] = min(abs(cdf(i)-cdf1));
    M(i)=index;
end

result = uint8(M(im)-1);

%matlab����
result1=histeq(im,hist1);

figure;
subplot(4,2,1),imshow(im),title('ԭͼ��');
subplot(4,2,2),imhist(im),title('ֱ��ͼ');
subplot(4,2,3),imshow(im1),title('ƥ��ͼ��');
subplot(4,2,4),imhist(im1),title('ֱ��ͼ');
subplot(4,2,5),imshow(result),title('���ͼ��');
subplot(4,2,6),imhist(result),title('ֱ��ͼ');
subplot(4,2,7),imshow(result1),title('histeq');
subplot(4,2,8),imhist(result1),title('ֱ��ͼ');
