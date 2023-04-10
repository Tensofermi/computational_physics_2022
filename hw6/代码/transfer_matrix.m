clear;
E=1;
V=0.9;
T=[-E,-1;1,0];
N=100000;
n=10;

RR=eye(2);
gamma=zeros(2,1);

for ni=1:N/n
if ni==1
Tn=eye(2);

for ii=1:n
Ti=T+[rand(),0;0,0];
% Ti=T+[V,0;0,0];
Tn=Ti*Tn;
end

[Q,R]=qr(Tn);
else
Tn=Q;

for ii=1:n
Ti=T+[rand(),0;0,0];
% Ti=T+[V,0;0,0];
Tn=Ti*Tn;
end

[Q,R]=qr(Tn);
end

gamma=gamma+(-log(diag(abs(R)).^2)/N);

end

xi=max(abs(1./gamma));