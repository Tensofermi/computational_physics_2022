clc;
clear;
N = 800;
t = 1;
delta = 1;
mu = 1;

% hopping
tlist = (2*ones(1,N-1)-1)*(-t);
Ht = diag(tlist,-1)+diag(tlist,1);

% PBC
Ht(1,N) = -t;
Ht(N,1) = -t;

% potential
Vlist = (2*ones(1,N)-1);
V = diag(1*Vlist);

H = Ht + 0*V;

[psi,E]=eig(H);

psi = psi.*conj(psi);

figure(1)
plot(psi(:,2),'b');
hold on;
plot(psi(:,4),'r');
hold on;
plot(psi(:,6),'g');
hold on;
xlabel('site i');
ylabel('psi^2');
title('ordered')