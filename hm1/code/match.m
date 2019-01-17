%灰度图直方图匹配

im=imread('EightAM.png');
hist=imhist(im);
cdf=cumsum(hist)/numel(im);

im1=imread('LENA.png');
hist1=imhist(im1);
cdf1=cumsum(hist1)/numel(im1);

%匹配
M = zeros(256,1);
for i=1:256
    [~,index] = min(abs(cdf(i)-cdf1));
    M(i)=index;
end

result = uint8(M(im)-1);

%matlab函数
result1=histeq(im,hist1);

figure;
subplot(4,2,1),imshow(im),title('原图像');
subplot(4,2,2),imhist(im),title('直方图');
subplot(4,2,3),imshow(im1),title('匹配图像');
subplot(4,2,4),imhist(im1),title('直方图');
subplot(4,2,5),imshow(result),title('结果图像');
subplot(4,2,6),imhist(result),title('直方图');
subplot(4,2,7),imshow(result1),title('histeq');
subplot(4,2,8),imhist(result1),title('直方图');
