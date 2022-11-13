clear;
N = 2;
L = 5;
t = 1;
mu = 1;

ii = 1;
for n = 0:2^L-1
base = dec2bin(n,L);
if sum(base-'0') == N
basis(ii,:) = base;
basiss(ii) = n;
ii = ii+1;
end
end
dim = length(basis);

Hmu = N*diag(ones(1,dim),0);

Hu = zeros(dim,dim);
for di =1:dim
Hu(di,di) = sum(diff(find(basis(di,:)-'0'==1))==1);
end

Ht = zeros(dim,dim);
for di = 1:dim
for dj = di:dim
for li = 1:L-1
bij = abs(basiss(dj) - basiss(di));
if abs(bij - 2^(li-1)) < 0.00001
Ht(di,dj) = Ht(di,dj) + 1;
end
end
Ht(dj,di) = Ht(di,dj);
end
end

for U = 0:0.2:10
H = mu*Hmu+(-t)*Ht+U*Hu;
E = eig(H);
plot(U*ones(1,length(E)),E,'r.');
xlabel(['$U$'],'Interpreter','latex');
ylabel(['$E_n$'],'Interpreter','latex');
fonts=15;
set(gca,'FontSize',fonts);
set(gca,'FontName','Times');
set(gca,'LineWidth',1.5)
xlim([0-0.3,10+0.3]);
hold on

end

U = 1;

for mu = 0:0.2:10
H = mu*Hmu+(-t)*Ht+U*Hu;
E = eig(H);
figure(2);
plot(mu*ones(1,length(E)),E,'r.');
xlabel(['$\mu$'],'Interpreter','latex');
ylabel(['$E_n$'],'Interpreter','latex');
fonts=15;
set(gca,'FontSize',fonts);
set(gca,'FontName','Times');
set(gca,'LineWidth',1.5)
xlim([0-0.3,10+0.3]);
hold on

end

mu = 1;

for t = 0:0.2:10
H = mu*Hmu+(-t)*Ht+U*Hu;
E = eig(H);
figure(3);
plot(t*ones(1,length(E)),E,'r.');
xlabel(['$t$'],'Interpreter','latex');
ylabel(['$E_n$'],'Interpreter','latex');
fonts=15;
set(gca,'FontSize',fonts);
set(gca,'FontName','Times');
set(gca,'LineWidth',1.5)
xlim([0-0.3,10+0.3]);
hold on

end


tlist = 0:0.1:2*pi;
for ti = 1:length(tlist)
theta = tlist(ti);
t = sin(theta);
U = cos(theta);
H = mu*Hmu+(-t)*Ht+U*Hu;
E(:,ti) = eig(H);
end

figure(4)
plot(tlist,E,'r.');
xlabel(['$\theta$'],'Interpreter','latex');
ylabel(['$E_n$'],'Interpreter','latex');
fonts=15;
set(gca,'FontSize',fonts);
set(gca,'FontName','Times');
set(gca,'LineWidth',1.5)
xlim([0,2*pi]);
