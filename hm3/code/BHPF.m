function H=BHPF(D0,height,width)

for i=1:height
    for j=1:width
        x=i-height/2;
        y=j-width/2;
        H(i,j)=1 / (1+ D0^2 / (x^2+y^2));
    end
end

end