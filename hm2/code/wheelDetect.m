clear,clc,close all;
car = imread('car.png');
mask = imread('wheel.png');
[height1,width1] = size(car);
[height2,width2] = size(mask);
 
% car_extΪ��car���б�Ե������ͼ��
car_ext = zeros(height1+height2-1,width1+width2-1);  
h2_2 = floor(height2/2);   % ģ��İ��
w2_2 = floor(width2/2);   % ģ��İ��
m1 = h2_2+1;      % ԭͼ��car�ڱ�Ե������ͼ��car_ext�е���ʼ��λ��
m2 = h2_2+height1;
n1 = w2_2+1;      % ԭͼ��car�ڱ�Ե������ͼ��car_ext�е���ʼ��λ��
n2 = w2_2+width1;
car_ext(m1:m2,n1:n2) = car;
 
g = zeros(height1+height2-1,width1+width2-1);  % g��¼���ֵ
m = zeros(height1+height2-1,width1+width2-1);  % ģ��
% �������ڽ�������˲�
for i = m1:m2
    for j = n1:n2
        sum1 = 0;
        sum2 = 0;
        m(i-h2_2:i+h2_2,j-w2_2:j+w2_2) = mask;
        for u = i-h2_2:i+h2_2
            for v = j-w2_2:j+w2_2
                sum1 = sum1+car_ext(u,v)*m(u,v);  % ģ���ԭͼ���Ӧλ����˺��ۼ�
                sum2 = sum2+car_ext(u,v)^2;  % sum2Ϊͼ������
            end
        end
        g(i,j) = sum1/sum2;   % ��һ��
    end
end
g = g(m1:m2,n1:n2);   % ���ֵ����ȥ����Ե��0
g = im2uint8(mat2gray(g));
tmp = max(g(:));    % �ҳ����ֵ��������ֵ
[y,x] = find(g == tmp); % �ҳ����ֵ������
fprintf("���ֵ���꣺ ");
z = [y x]

figure,imshow(car);
figure,imshow(g);