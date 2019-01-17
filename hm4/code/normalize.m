function img=normalize(src)

maxPixel=max(max(src));
minPixel=min(min(src));
img=(src-minPixel)./(maxPixel-minPixel).*255;
img=uint8(img);

end