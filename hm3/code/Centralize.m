function res=Centralize(img)

[height,width]=size(img);
res=double(img);
for i=1:height
    for j=1:width
        if mod(i+j,2)==1
            res(i,j)=-res(i,j);
        end
    end
end

end