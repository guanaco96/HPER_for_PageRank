function it = jacobi(A,v,tau,itmax, mod)
n = size(A,1);
e = ones(n,1);
v = (1-tau)/sum(v)*v;
d = A*e;
dang = d==0;
d = d+n*dang;
d = 1./d;
A = spdiags(d,[0],n,n)*A;
A = A';
dang = dang/n;
s = e-tau*(diag(A)+dang);
s = 1./s;
x = rand(n,1);
x = x/sum(x);
for it=1 : itmax
    y = s.*x;
    y = y-tau*(A*y+(dang'*y)*e);
    err = norm(y-v);
    y = v+x-y;
    %disp([it,err]);
    x=y;
    if err<1.e-13*norm(y)
        break;
    end
    y=s.*y;
end
%disp(it)
if it == itmax
     disp('raggiunto il numero massimo di iterazioni')
end
end