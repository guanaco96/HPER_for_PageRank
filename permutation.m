function permutation(y,z) 
n=size(y,1);
[su1,iu1]=sort(y, 'descend');
[su2,iu2]=sort(z, 'descend');
idx=zeros(n,1);
iu2=iu2';
for i=1 : 100
    idx(i)=find(iu2==iu1(i));
end
for i=1:20
    disp([i,idx(i)])
end
plot(idx(1:100), 'Linewidth', 3)
end