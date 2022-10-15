clear
clc

a = 5;
k = 1;
X = 10;     % ������:[-X,X] 
N = 200;    % ����� /in [-X,X]
dx = 2*X/N;   % �ռ䲽��:�����򳤶�/�����

x = linspace(-X,X,N);

% �Ƴ�
n = 2;      % ����n
dxi = (2*X)/(N-1);
V = zeros([N,1]);
for xi = -X:dxi:X
% V(round((xi+X)/dxi+1)) = 1/2*xi^n + a*sin(k*xi);

if(xi>0)
    V(round((xi+X)/dxi+1)) = 1*xi;
else 
    V(round((xi+X)/dxi+1)) = 8e4;
end

end
A = spdiags(V,0,N,N);  % ��ȡV�ĶԽ��߲��������ܾ���
figure(1)
plot(V)

% ����
H = zeros(N,3);
H(1:N,1) = -0.5/dx^2;
H(1:N,2) = 1/dx^2;
H(1:N,3) = -0.5/dx^2;
B = spdiags(H,-1:1,N,N);

C = A+B;
E = 9;    % �ܼ�����
% ������ֵ
[Vector, Value] = eigs(C,E,0);  % ��ָ���ļ�������ֵ

% ��ͼ
for i = 1:E
    psi = Vector(:,i);
    figure(2)
    subplot(3,3,i)
    plot(x,abs(psi).^2/sum(abs(psi).^2*dx))
    ylim([0 0.8])
    xlabel('x');ylabel('P');
end

% �����̬����������ֵ
v=[];
for i = 1:length(Value)
    v(i)= Value(i,i);
end
sort(v)
