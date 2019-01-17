function H=threshold(I)

%迭代式阈值分割   
zmax=max(max(I));%取出最大灰度值  
zmin=min(min(I));%取出最小灰度值  
T=uint8((zmax+zmin)/2);
flag=1;  
[m,n]=size(I);  

while(flag)   
    G1=1;  
    G2=1;    
    G1sum=0;  
    G2sum=0;  
    for i=1:m  
        for j=1:n  
            tmp=I(i,j);  
            if(tmp>=T)   
                G1=G1+1;  
                G1sum=G1sum+double(tmp);  
            else  
                G2=G2+1;  
                G2sum=G2sum+double(tmp);  
            end  
        end  
    end  
    %计算平均值  
    z1=G1sum/G1;
    z2=G2sum/G2;
    tktmp=uint8((z1+z2)/2); 
    if(tktmp==T)  
        flag=0;  
    else  
        T=tktmp;  
    end  
    %当阈值不再变化时,说明迭代结束  
end  

disp(strcat('迭代的阈值:',num2str(T)));
H=imbinarize(I,double(T)/255);

end