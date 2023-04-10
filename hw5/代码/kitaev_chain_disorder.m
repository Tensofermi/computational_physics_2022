clear;
N = 50;
t = 1;
delta = 0.5;
alpha = (sqrt(5)-1)/2;

for lamda = 0:0.1:5

mulist = zeros(1,N);
for i = 1:N
mulist(i) = lamda*cos(2*pi*alpha*i);
end
Hmu = diag(mulist ,0);

Ht = diag(ones(1,N-1)*(-t),-1)+diag(ones(1,N-1)*(-t),1);

Hmt = Ht + Hmu;

Hd = diag(ones(1,N-1)*(-delta),-1)+diag(ones(1,N-1)*(delta),1);

H = [Hmt,Hd;Hd',-Hmt]/2;

E=abs(eig(H));

plot(lamda*ones(length(E)),E,'b.');
xlabel('lamda');
ylabel('E');
hold on;
end