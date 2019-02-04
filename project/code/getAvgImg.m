function H=getAvgImg(m,index)

for i=1:7
    img=uint8(imread(['orl_faces/s' num2str(m) '/' num2str(index(i)) '.pgm']));
    [height,width]=size(img);
    imgs(i,:)=reshape(img,[height*width,1]);
end
H=mean(imgs);

end