function [I]=myHisteq(I)

[height,width] = size(I);

%�������ػҶ�ͳ��;
grayPixel = zeros(256,1);    %ͳ�Ƹ��Ҷ���Ŀ����256���Ҷȼ�
for i = 1:height
    for j = 1: width
        grayPixel(I(i,j) + 1) = grayPixel(I(i,j) + 1) + 1;    %��Ӧ�Ҷ�ֵ���ص���������һ
    end
end

%����Ҷȷֲ��ܶ�
ProbPixel = zeros(256,1);
for i = 1:256
    ProbPixel(i) = grayPixel(i) / (height * width);
end

%�����ۼ�ֱ��ͼ�ֲ�
cdfPixel = zeros(256,1);
for i = 1:256
    if i == 1
        cdfPixel(i) = ProbPixel(i);
    else
        cdfPixel(i) = cdfPixel(i - 1) + ProbPixel(i);
    end
end

%���д��
%hist=imhist(I);
%cdfPixel=cumsum(hist) / numel(I);

%ȡ��
cdfPixel = round(cdfPixel.*255);

%�ԻҶ�ֵ����ӳ�䣨���⻯��
for i = 1:height
    for j = 1:width
        I(i,j) = cdfPixel(I(i,j)+1);
    end
end

end