clear,clc,close all;
car = imread('car.png');
mask = imread('wheel.png');
[height1,width1] = size(car);
[height2,width2] = size(mask);
 
% car_ext为对car进行边缘补零后的图像
car_ext = zeros(height1+height2-1,width1+width2-1);  
h2_2 = floor(height2/2);   % 模板的半高
w2_2 = floor(width2/2);   % 模板的半宽
m1 = h2_2+1;      % 原图像car在边缘补零后的图像car_ext中的起始行位置
m2 = h2_2+height1;
n1 = w2_2+1;      % 原图像car在边缘补零后的图像car_ext中的起始列位置
n2 = w2_2+width1;
car_ext(m1:m2,n1:n2) = car;
 
g = zeros(height1+height2-1,width1+width2-1);  % g记录相关值
m = zeros(height1+height2-1,width1+width2-1);  % 模板
% 滑动窗口进行相关滤波
for i = m1:m2
    for j = n1:n2
        sum1 = 0;
        sum2 = 0;
        m(i-h2_2:i+h2_2,j-w2_2:j+w2_2) = mask;
        for u = i-h2_2:i+h2_2
            for v = j-w2_2:j+w2_2
                sum1 = sum1+car_ext(u,v)*m(u,v);  % 模板和原图像对应位置相乘后累加
                sum2 = sum2+car_ext(u,v)^2;  % sum2为图像内容
            end
        end
        g(i,j) = sum1/sum2;   % 归一化
    end
end
g = g(m1:m2,n1:n2);   % 相关值矩阵去除边缘的0
g = im2uint8(mat2gray(g));
tmp = max(g(:));    % 找出相关值矩阵的最大值
[y,x] = find(g == tmp); % 找出最大值的坐标
fprintf("最大值坐标： ");
z = [y x]

figure,imshow(car);
figure,imshow(g);