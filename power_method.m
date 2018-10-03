function it = power_method(A, v, tau, itmax, mod)
n = size(A,1);
e = ones(n,1);
d = A*e;
d = d';
dang = d==0;
d = d + dang*n;
dang = dang'/n;
d = 1./d;
x = rand(1,n);
x = x/sum(x);
v = (1-tau)/sum(v)*v;
v=v';
for it=1:itmax
     y = x.*d;
     y = y*A+(x*dang)*e';
     y = tau*y+v;
     err = norm(x-y);
     x = y;
     %disp([it,err])
     if err<1.e-13*norm(y)
          break
     end
end
%disp(it)
if it == itmax
     disp('raggiunto il numero massimo di iterazioni')
end
end