function K=myErode(I,se,x0,y0)

[m,n]=size(I);
[m1,n1]=size(se);
J=zeros(m+2*(m1-1),n+2*(n1-1));
J(m1:m1+m-1,n1:n1+n-1)=I;
K=I;
num=sum(sum(se==1));
for i=m1:m1+m-1
    for j=n1:n1+n-1
        bmatch=false;
        s=0;
        for k=1:m1
            for l=1:n1
                if se(k,l)==0   %�����ĵ�Ԫ��
                    continue;
                end
                if se(k,l)==1   %���Ԫ��
                    if J(i+k-x0,j+l-y0)==1  %��ԭ��ԽṹԪ�ر���
                        s=s+1;
                    end
                end
                if s==num
                    bmatch=true;
                    break;
                end
            end
        end
        if bmatch
            K(i-m1+1,j-n1+1)=1;
        else
            K(i-m1+1,j-n1+1)=0;
        end
    end
end

end