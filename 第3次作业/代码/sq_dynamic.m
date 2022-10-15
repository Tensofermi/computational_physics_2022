clc
clear

N = 2000;
% x�ķ�Χ;
x= linspace(-1,1,N);
% x�ĳ�ʼֵ;
x_0 = -0.4;

% ����
C = 1;
a = 2e-3;
k = 400;

% ����
dx = 1e-3;
dt = 1e-7;

% ��ʼ����
p_x = C*exp(-(x-x_0).^2/a).*exp(1i*k*x);
% ��ȡ�鲿��ʵ��
R_0 = real(p_x);
I_0 = imag(p_x);
I_next = zeros(1,N);
R_next = zeros(1,N);

% �����Ƴ�V��x=0.6��
V = zeros(1, N);
V(1:1000) = 0;
V(1000:N) = 8e4;

% ����V��ͼ��
plot(V)
title('����');
xlabel('λ�� x');
ylabel('���� p');
pause(2)
% ��ʼ����ǰ��ʵ�����鲿
I_now = I_0;
R_now = R_0;

%for n = 2:N-1
   % tʱ��I��ֵ
%   I_next(n) = I_now(n)+dt/(2*dx^2)*(R_now(n+1)-2*R_now(n)+R_now(n-1))-dt*V(n).*R_now(n);
   % �߽�ֵ
%   I_next(1) = I_next(2);
%   I_next(N) = I_next(N-1);
%end

for t = 1:200000

    for n = 2:N-1
        % tʱ��R��ֵ
        R_next(n) = R_now(n)-dt/(2*dx^2)*(I_now(n+1)-2*I_now(n)+I_now(n-1))+dt*V(n).*I_now(n);
        % �߽�ֵ
        R_next(1) = R_next(2);
        R_next(N) = R_next(N-1);
    end
    R_now = R_next;
    
    for n = 2:N-1
        % tʱ��I��ֵ
        I_next(n) = I_now(n)+dt/(2*dx^2)*(R_now(n+1)-2*R_now(n)+R_now(n-1))-dt*V(n).*R_now(n);
        % �߽�ֵ 
        I_next(1) = I_next(2);
        I_next(N) = I_next(N-1);
    end 
    % �����ܶ�
    Px = R_now.^2 + I_now.^2;
    I_now = I_next;
    
    % ����t=10�ı�����ͼ��
    if  mod(t, 100) == 0
        plot(x, Px, 'LineWidth',2)
        title('����');
        axis([-1 1 0 2]);
        xlabel('λ�� x');
        ylabel('�����ܶ� p');
        set(gca,'XAxisLocation','origin','YAxisLocation','origin')
        drawnow;
    end
end