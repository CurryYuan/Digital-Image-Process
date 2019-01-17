function H=threshold(I)

%����ʽ��ֵ�ָ�   
zmax=max(max(I));%ȡ�����Ҷ�ֵ  
zmin=min(min(I));%ȡ����С�Ҷ�ֵ  
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
    %����ƽ��ֵ  
    z1=G1sum/G1;
    z2=G2sum/G2;
    tktmp=uint8((z1+z2)/2); 
    if(tktmp==T)  
        flag=0;  
    else  
        T=tktmp;  
    end  
    %����ֵ���ٱ仯ʱ,˵����������  
end  

disp(strcat('��������ֵ:',num2str(T)));
H=imbinarize(I,double(T)/255);

end