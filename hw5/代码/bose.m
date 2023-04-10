clear;
N = 500;
t = 1;
g = 1.000;
n0 = 1;
mu = 5;

for mu = 0:0.5:5
    
mulist = (-mu+g*n0)*ones(1,N);
Hmu = diag(mulist ,0);

Ht = diag(ones(1,N-1)*(-t),-1)+diag(ones(1,N-1)*(-t),1);
Hmt = Ht + Hmu;

Hd = diag(0.5*g*n0*ones(1,N),0);

H = [Hmt,Hd;Hd',Hmt]/2;
H = [diag(ones(1,N)),zeros(N,N);zeros(N,N),-diag(ones(1,N))]*H;

E=(eig(H));

plot(mu*ones(length(E)),E,'b.');
xlabel('mu');
ylabel('E');
hold on
end