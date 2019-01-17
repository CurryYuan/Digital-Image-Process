function [I]=myHisteq(I)

[height,width] = size(I);

%进行像素灰度统计;
grayPixel = zeros(256,1);    %统计各灰度数目，共256个灰度级
for i = 1:height
    for j = 1: width
        grayPixel(I(i,j) + 1) = grayPixel(I(i,j) + 1) + 1;    %对应灰度值像素点数量增加一
    end
end

%计算灰度分布密度
ProbPixel = zeros(256,1);
for i = 1:256
    ProbPixel(i) = grayPixel(i) / (height * width);
end

%计算累计直方图分布
cdfPixel = zeros(256,1);
for i = 1:256
    if i == 1
        cdfPixel(i) = ProbPixel(i);
    else
        cdfPixel(i) = cdfPixel(i - 1) + ProbPixel(i);
    end
end

%简洁写法
%hist=imhist(I);
%cdfPixel=cumsum(hist) / numel(I);

%取整
cdfPixel = round(cdfPixel.*255);

%对灰度值进行映射（均衡化）
for i = 1:height
    for j = 1:width
        I(i,j) = cdfPixel(I(i,j)+1);
    end
end

end