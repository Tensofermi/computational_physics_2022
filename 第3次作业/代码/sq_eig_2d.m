clc
clear

a = 3;

% 最好设为偶数!
X = 10;     % 定义域:[-X,X]&[-X,X]
N = 100;    % 一维格点数 /in [-X,X]

% 空间步长:定义域长度/格点数
dx = 2*X/N;   
dy = dx;


% 势场
V = zeros([N,N]);
dxi = (2*X)/(N-1);
for xi = -X:dxi:X
    for yi = -X:dxi:X
%     V(round((xi+X)/dxi+1),round((yi+X)/dxi+1)) = 1/2*(xi^2+yi^2);   %  二维谐振子

if(xi*xi+yi*yi+a*xi-a*sqrt(xi*xi+yi*yi)<0)                        %  心形线势场
      V(round((xi+X)/dxi+1),round((yi+X)/dxi+1)) = 0; 
else
     V(round((xi+X)/dxi+1),round((yi+X)/dxi+1)) = 8e4; 
end

    end
end
VV = reshape(V',[N*N,1]);   % 转为一维对角元素
A = spdiags(VV,0,N*N,N*N);  % 提取V的对角线并生成势能矩阵

figure(1)
surf(V)


% 动能
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
E = 9;    % 能级个数
% 求特征值
[Vector, Value] = eigs(C,E,0);  % 求指定的几个特征值


% 画图
for i = 1:E
    psi = Vector(:,i);
    psi = reshape(psi,[N,N]);
    psi = abs(psi).^2/sum(sum(abs(psi).^2*dx*dx));
    figure(2)
    subplot(3,3,i)
    surf(psi)
end



% 输出基态附近的能量值
v=[];
for i = 1:length(Value)
    v(i)= Value(i,i);
end
sort(v)
