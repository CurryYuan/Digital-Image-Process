clear;clc;
N=40;
n=7;

for time=1:50
    for i=1:N
        index(i,:)=randperm(10);
        img(i,:)=getAvgImg(i,index(i,:));
    end
    
    mean_img=mean(img,2);
    [coff,score,latent]=pca(img);
    img1=img*coff;
    
    num=0;
    for i=1:N
        for j=8:10
            res=test(i,index(i,j),coff,img1);
            if(res==i)
                num=num+1;
            end
        end
    end
    accuracy(time)=num/120;
end

s=sprintf("最高准确率：%f",max(accuracy));
disp(s);
s1=sprintf("最低准确率：%f",min(accuracy));
disp(s1);
plot(accuracy),title("准确率");