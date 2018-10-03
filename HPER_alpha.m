function it = HPER_alpha(A, v, tau, itmax, alpha)
unalpha=1-alpha;
n = size(A,1);
v = (1-tau)/sum(v)*v;
e = ones(n,1);
d = A*e;
dang = d==0;
d = d+n*dang;
d = 1./d;
A = A';
beta = 1/sqrt(2*sqrt(n)*(sqrt(n)-1));
w = -ones(n,1)*beta;
w(1) = w(1)+beta*sqrt(n);
Aw = A*(w.*d)+(dang'*(w.*d))*e;
Aw = alpha*w+unalpha*Aw;
wtA = d'.*(w'*A)+sum(w)*(dang'.*d');
wtA = alpha*w'+unalpha*wtA;
A11=alpha+unalpha*(A(1,1)+dang(1))*d(1);
sumA1=alpha+unalpha*sum((A(1,:)+dang').*d');
gamma = A11-(sumA1+1)/sqrt(n)+1;
gamma = n*beta^2*gamma;
s = zeros(n,1);
for i = 1 : n
    s(i) = Aw(i)+wtA(i)-2*gamma*w(i);
    Aii=alpha+unalpha*d(i)*(A(i,i)+dang(i));
    s(i) = Aii-2*w(i)*s(i);
end
s = e-tau*s;
s = 1./s;
y0 = v-2*(w'*v)*w;
y0 = y0.*s;
y0 = y0-2*(w'*y0)*w;
x = rand(n,1);
x = x/sum(x);
dang_red = dang.*d;
for it = 1 : itmax
    Ax = A*(x.*d)+(dang_red'*x)*e;
    Ax = alpha*x+unalpha*Ax;
    y = x-tau*Ax;
    err = norm(v-y);
    y = y-2*(w'*y)*w;
    y = y.*s;
    y = y-2*(w'*y)*w;
    y = y0+x-y;
    %disp([it,err])
    if err<1.e-13*norm(y)
        break
    end
    x=y;
end
%disp(it)
if it == itmax
   disp("raggiunto il numero massimo di iterazioni")
end
end