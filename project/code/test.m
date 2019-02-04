function H=test(m,n,coff,eigenfaces)

img=double(imread(['orl_faces/s' num2str(m) '/' num2str(n) '.pgm']));
[height,width]=size(img);
img=reshape(img,[1,height*width]);
img1=img*coff;
for i=1:40
    d(i)=norm(img1-eigenfaces(i,:));
end

[~,H]=min(d);

end