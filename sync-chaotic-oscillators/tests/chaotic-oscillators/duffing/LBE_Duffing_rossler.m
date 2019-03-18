clc, close all, clear all
%

% Carregando os dados do Lorenz
y0    = load('xduffk0.dat');
y2    = load('xduffk100.dat');
y5    = load('xduffk200.dat');
y10   = load('xduffk300.dat');
y15   = load('xduffk400.dat');
% y30   = load('xduffk0.dat');
% y40   = load('xlor_k=40.dat');
% y250  = load('xlor_k=250.dat');
% y500  = load('xlor_k=500.dat');
% y1000 = load('xlor_k=1000.dat');


% Carregando os dados da Extensão do lorenz

x0    = load('xduffk0_ext.dat');
x2    = load('xduffk100_ext.dat');
x5    = load('xduffk200_ext.dat');
x10   = load('xduffk300_ext.dat');
x15   = load('xduffk400_ext.dat');
% x30   = load('xduffk0_ext.dat');
% x40   = load('xlor_ext_k=40.dat');
% x250  = load('xlor_ext_k=250.dat');
% x500  = load('xlor_ext_k=500.dat');
% x1000 = load('xlor_ext_k=1000.dat');

% Condição inicial igual a 1 

% z1 = load('xlor_cond1=0.dat');
% w1 = load('xlor_cond1=30.dat');
% k1 = load('xlor_cond1=40.dat');
% 
% % Condição inicial igual a 2 
% z2 = load('xlor_cond2=0.dat');
% w2 = load('xlor_cond2=30.dat');
% k2 = load('xlor_cond2=40.dat');

% tamanho dos dados

N = length(x0);

for k = 1:N
    a(k)= log10((abs(y0(k)-x0(k)))/2);
    b(k)= log10((abs(y2(k)-x2(k)))/2);
    c(k)= log10((abs(y5(k)-x5(k)))/2);
    d(k)= log10((abs(y10(k)-x10(k)))/2);
    e(k)= log10((abs(y15(k)-x15(k)))/2);
%     f(k)= log10((abs(y30(k)-x30(k)))/2);
%     g(k)= log10((abs(y40(k)-x40(k)))/2);
%     h(k)= log10((abs(y250(k)-x250(k)))/2);
%     i(k)= log10((abs(y500(k)-x500(k)))/2);
%     j(k)= log10((abs(y1000(k)-x1000(k)))/2);       
end

figure(1)
plot(a)
hold on
plot(b,'r')
plot(c,'g')
plot(d,'k')
% plot(e,'m')

xlabel('Iterations')
ylabel('log_{10}(\epsilon_{\alpha,n})')
legend('LBE Duffing for k=0','LBE Duffing for k=100','LBE Duffing for k=200','LBE Duffing for k=300','LBE Duffing for k=400');
%title('LBE do acoplamento de lorenz ao Duffing');

% figure(2)
% plot(b)
% xlabel('Iteração')
% ylabel('Amplitute')
% legend('LBE Lorenz para k=2');
% title('LBE do acoplamento de lorenz ao Duffing');
% 
% figure(3)
% plot(c)
% xlabel('Iteração')
% ylabel('Amplitute')
% legend('LBE Lorenz para k=5');
% title('LBE do acoplamento de lorenz ao Duffing');
% 
% figure(4)
% plot(d)
% xlabel('Iteração')
% ylabel('Amplitute')
% legend('LBE Lorenz para k=10');
% title('LBE do acoplamento de lorenz ao Duffing');
% 
% figure(5)
% plot(e)
% xlabel('Iteração')
% ylabel('Amplitute')
% legend('LBE Lorenz para k=15');
% title('LBE do acoplamento de lorenz ao Duffing');
% 
% figure(6)
% plot(f)
% xlabel('Iteração')
% ylabel('Amplitute')
% legend('LBE Lorenz para k=30');
% title('LBE do acoplamento de lorenz ao Duffing');

% figure(7)
% plot(g)
% xlabel('Iteração')
% ylabel('Amplitute')
% legend('LBE Lorenz para k=40');
% title('LBE do acoplamento de lorenz ao Duffing');
% 
% figure(8)
% plot(h)
% xlabel('Iteração')
% ylabel('Amplitute')
% legend('LBE Lorenz para k=250');
% title('LBE do acoplamento de lorenz ao Duffing');
% 
% figure(9)
% plot(i)
% xlabel('Iteração')
% ylabel('Amplitute')
% legend('LBE Lorenz para k=500');
% title('LBE do acoplamento de lorenz ao Duffing');

% figure(10)
% plot(j)
% xlabel('Iteração')
% ylabel('Amplitute')
% legend('LBE Lorenz para k=1000');
% title('LBE do acoplamento de lorenz ao Duffing');
% 
% figure(11)
% plot(z1(17000:end),z2(17000:end)) 
% xlabel('Condição inicial 1')
% ylabel('Condição inicial 2')
% legend('Lorenz acoplados com k=0');
% title('LBE do acoplamento de lorenz ao Duffing');
% 
% figure(12)
% plot(w1(17500:end),w2(17500:end))
% xlabel('Condição inicial 1')
% ylabel('Condição inicial 2')
% legend('Lorenz acoplados com k=30');
% title('Diferentes condições iniciais');
% 
% figure(13)
% plot(k1(17500:end),k2(17500:end))
% xlabel('Condição inicial 1')
% ylabel('Condição inicial 2')
% legend('Lorenz acoplados com k=40');
% title('Diferentes condições iniciais');


    
    
    
    
    