clear;
data=[0 0 0 0 0 0 0;
      0 0 1 1 0 0 0;
      0 0 0 1 0 0 0;
      0 0 0 1 1 0 0;
      0 0 1 1 1 1 0;
      0 0 1 1 1 0 0;
      0 1 0 1 0 1 0;
      0 0 0 0 0 0 0];
A=[1 1 1];
res1=myDilate(data,A,1,1)
res2=myErode(data,A,1,1)

B=[1 1;0 1];
res3=myDilate(data,B,1,2)
res4=myErode(data,B,1,2)

res5=myDilate(res2,A,1,1)
res6=myDilate(res4,B,1,2)

res7=myErode(res1,A,1,1)
res8=myErode(res3,B,1,2)