function K=myDilate(I,se,x0,y0)

[m,n]=size(I);
[m1,n1]=size(se);
J=zeros(m+2*(m1-1),n+2*(n1-1));
J(m1:m1+m-1,n1:n1+n-1)=I;
K=zeros(m,n);

num=sum(sum(se==1));
for i=m1:m1+m-1
    for j=n1:n1+n-1
        bmatch=false;
        s=0;
        for k=1:m1
            for l=1:n1
                if se(k,l)==1   %相关元素
                    if J(i+k-x0,j+l-y0)==1  %以原点对结构元素遍历
                        K(i-m1+1,j-n1+1)=1;
                        bmatch=true;
                        break;
                    end
                end
            end
            if bmatch
                break;
            end
        end
    end
end

end