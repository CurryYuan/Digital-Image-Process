function H=HomoFilter(High,Low,C,D0,height,width)

for i=1:height
    for j=1:width
        x=i-height/2;
        y=j-width/2;
        H(i,j)=(High-Low)*(1-exp(-C*(x^2+y^2)/D0^2))+Low;
    end
end

end