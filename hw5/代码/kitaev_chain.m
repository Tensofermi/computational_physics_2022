clear;
N = 50;
t = 1;
delta = 1;

for mu = 0:0.1:5

mulist = -mu*ones(1,N);
Hmu = diag(mulist ,0);

Ht = diag(ones(1,N-1)*(-t),-1)+diag(ones(1,N-1)*(-t),1);

Hmt = Ht + Hmu;

Hd = diag(ones(1,N-1)*(-delta),-1)+diag(ones(1,N-1)*(delta),1);

H = [Hmt,Hd;Hd',-Hmt]/2;

E=eig(H);

plot(mu*ones(length(E)),E,'b.');
xlabel('mu');
ylabel('E');
hold on;
end