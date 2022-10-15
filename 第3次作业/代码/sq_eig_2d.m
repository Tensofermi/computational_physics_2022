clc
clear

a = 3;

% �����Ϊż��!
X = 10;     % ������:[-X,X]&[-X,X]
N = 100;    % һά����� /in [-X,X]

% �ռ䲽��:�����򳤶�/�����
dx = 2*X/N;   
dy = dx;


% �Ƴ�
V = zeros([N,N]);
dxi = (2*X)/(N-1);
for xi = -X:dxi:X
    for yi = -X:dxi:X
%     V(round((xi+X)/dxi+1),round((yi+X)/dxi+1)) = 1/2*(xi^2+yi^2);   %  ��άг����

if(xi*xi+yi*yi+a*xi-a*sqrt(xi*xi+yi*yi)<0)                        %  �������Ƴ�
      V(round((xi+X)/dxi+1),round((yi+X)/dxi+1)) = 0; 
else
     V(round((xi+X)/dxi+1),round((yi+X)/dxi+1)) = 8e4; 
end

    end
end
VV = reshape(V',[N*N,1]);   % תΪһά�Խ�Ԫ��
A = spdiags(VV,0,N*N,N*N);  % ��ȡV�ĶԽ��߲��������ܾ���

figure(1)
surf(V)


% ����
H = zeros(N*N);
for j = 1 : N
    for i = 1 : N
        
     H(N*(j-1)+i,N*(j-1)+i) = -4;
     if(N*(j-1)+i+1>0 && N*(j-1)+i+1<N^2) % i+1
      H(N*(j-1)+i,N*(j-1)+i+1) = 1;
     end
     if(N*(j-1)+i-1>0 && N*(j-1)+i-1<N^2) % i-1
      H(N*(j-1)+i,N*(j-1)+i-1) = 1;
     end
      if(N*(j)+i>0 && N*(j)+i<N^2) % j+1
      H(N*(j-1)+i,N*(j)+i) = 1;
     end
     if(N*(j-2)+i>0 && N*(j-2)+i<N^2) % j-1
      H(N*(j-1)+i,N*(j-2)+i) = 1;
     end
      
    end
end

H = -1/(2*dx^2).*H;
B = sparse(H);

C = A+B;
E = 9;    % �ܼ�����
% ������ֵ
[Vector, Value] = eigs(C,E,0);  % ��ָ���ļ�������ֵ


% ��ͼ
for i = 1:E
    psi = Vector(:,i);
    psi = reshape(psi,[N,N]);
    psi = abs(psi).^2/sum(sum(abs(psi).^2*dx*dx));
    figure(2)
    subplot(3,3,i)
    surf(psi)
end



% �����̬����������ֵ
v=[];
for i = 1:length(Value)
    v(i)= Value(i,i);
end
sort(v)
