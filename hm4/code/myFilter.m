function H=myFilter(height,width,T,a,b)

for u=1:height
    for v=1:width
        x=u-height/2;
        y=v-width/2;
        c=pi*(x*a+y*b);
        if(c==0)
            H(u,v)=T;
        else
            H(u,v)=T/c*sin(c)*exp(-1j*c);
        end
    end
end

end