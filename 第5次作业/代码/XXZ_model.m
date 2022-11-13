clear
dim = 10;
delta = 1;

for J = 0:0.2:10

Hz = diag(ones(1,dim)*(-J)*delta,0);

Hxy = zeros(dim,dim);
Hxy(1,2) = -0.5*J;
Hxy(2,1) = -0.5*J; Hxy(2,3) = -0.5*J; Hxy(2,4) = -0.5*J;
Hxy(3,2) = -0.5*J; Hxy(3,5) = -0.5*J; 
Hxy(4,2) = -0.5*J; Hxy(4,5) = -0.5*J; Hxy(4,7) = -0.5*J;
Hxy(5,3) = -0.5*J; Hxy(5,4) = -0.5*J; Hxy(5,6) = -0.5*J; Hxy(5,8) = -0.5*J;
Hxy(6,5) = -0.5*J; Hxy(6,9) = -0.5*J;
Hxy(7,4) = -0.5*J; Hxy(7,8) = -0.5*J;
Hxy(8,5) = -0.5*J; Hxy(8,7) = -0.5*J; Hxy(8,9) = -0.5*J;
Hxy(9,6) = -0.5*J; Hxy(9,8) = -0.5*J; Hxy(9,10) = -0.5*J;
Hxy(10,9) = -0.5*J;

H = Hz + Hxy;

E = eig(H);

plot(J*ones(1,dim),E,'r.');
xlabel(['$J$'],'Interpreter','latex');
ylabel(['$E_n$'],'Interpreter','latex');
fonts=15;
set(gca,'FontSize',fonts);
set(gca,'FontName','Times');
set(gca,'LineWidth',1.5)
xlim([0-0.3,10+0.3]);
hold on;

end


for delta = 0:0.2:10

Hz = diag(ones(1,dim)*(-J)*delta,0);

Hxy = zeros(dim,dim);
Hxy(1,2) = -0.5*J;
Hxy(2,1) = -0.5*J; Hxy(2,3) = -0.5*J; Hxy(2,4) = -0.5*J;
Hxy(3,2) = -0.5*J; Hxy(3,5) = -0.5*J; 
Hxy(4,2) = -0.5*J; Hxy(4,5) = -0.5*J; Hxy(4,7) = -0.5*J;
Hxy(5,3) = -0.5*J; Hxy(5,4) = -0.5*J; Hxy(5,6) = -0.5*J; Hxy(5,8) = -0.5*J;
Hxy(6,5) = -0.5*J; Hxy(6,9) = -0.5*J;
Hxy(7,4) = -0.5*J; Hxy(7,8) = -0.5*J;
Hxy(8,5) = -0.5*J; Hxy(8,7) = -0.5*J; Hxy(8,9) = -0.5*J;
Hxy(9,6) = -0.5*J; Hxy(9,8) = -0.5*J; Hxy(9,10) = -0.5*J;
Hxy(10,9) = -0.5*J;

H = Hz + Hxy;

E = eig(H);

figure(2)
plot(delta*ones(1,dim),E,'r.');
xlabel(['$\Delta$'],'Interpreter','latex');
ylabel(['$E_n$'],'Interpreter','latex');
fonts=15;
set(gca,'FontSize',fonts);
set(gca,'FontName','Times');
set(gca,'LineWidth',1.5)
xlim([0-0.3,10+0.3]);
hold on;

end