clear,clc,close all;
f0=imread('sport car.pgm');
[height,width]=size(f0);
t1=255*rand([height,width]);
t2=255*rand([height,width]);

f=size(f0);
for i=1:height
    for j=1:width
        if f0(i,j) > max(t1(i,j),t2(i,j))
            f(i,j)=255;
        elseif f0(i,j) < min(t1(i,j),t2(i,j))
            f(i,j)=0;
        else
            f(i,j)=f0(i,j);
        end
    end
end

f1=f;
for i=2:height-1
    for j=2:width-1
        c=f(i-1:i+1,j-1:j+1);   %3*3邻域
        e=c(1,:);       %c矩阵的第一行
        for u=2:3
            e=[e,c(u,:)];    %将c矩阵变为一个行矩阵         
        end
        m=median(e);    %取中值
        f1(i,j)=m;
    end
end

f2=medfilt2(f);

figure;
subplot(2,2,1),imshow(f0),title('original');
subplot(2,2,2),imshow(f),title('noise');
subplot(2,2,3),imshow(f1),title('myMedfilt');
subplot(2,2,4),imshow(f2),title('medfilt2');