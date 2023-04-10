clear;
N = 2;
L = 5;
t = 1;
mu = 1;
Q = 3;

ii = 1;
for n = 0:Q^L-1
base = dec3bin(n,L);
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
base = [];
for li =1:L
base = [base str2num(basis(di,li))];
end

Hu(di,di) = sum(base.*(base-1));
end

Ht = zeros(dim,dim);
for di = 1:dim
for dj = di:dim
for li = 1:L-1
bij = basiss(dj) - basiss(di);
if abs(bij - 2*3^(li-1)) < 0.00001
state = basis(dj,:);
aa = sqrt(str2num(state(L-li+1))+1)*...
sqrt(str2num(state(L-li)));
Ht(di,dj) = Ht(di,dj) + aa;
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



function out = bin3dec( a )

out = 0;
for ii = 1:length(a)
out = out+ str2num(a(ii))*3^(length(a)-ii);
end

end


function out = dec3bin(b,L)
out=[];
while (b>0)
c=mod(b,3);
out=[num2str(c) out];
b=(b-c)/3;
end

for ii = 1:L-length(out)
out = ['0' out];
end
end
