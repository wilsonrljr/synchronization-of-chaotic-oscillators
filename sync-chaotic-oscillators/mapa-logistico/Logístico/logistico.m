clc; clear all; close all;

format long;

r = 4;
T = 100; 
x(1) = 0.95;

%------------------------ 1° MAPA LOGÍSTICO -------------------------------

for it=1:T-1

x(it+1)=r*x(it)*(1-x(it));

end

% EXTENSÃO DO 1º MAPA LOGÍSTICO

x_ext(1)=0.95;

for it=1:T-1
    
x_ext(it+1)=r*x_ext(it)*(1)-r*x_ext(it)*x_ext(it);

end

tempo=(1:T)-1;

%axis([-1 200 0 1])

figure(1)
plot(tempo,x,'*-')
xlabel('Tempo (anos)')
ylabel('População')
title('Mapa logístico para r = 4 (sincronizado)')
hold on

% LBE 1º MAPA LOGÍSTICO E EXTENSÃO

N = length(x);

for k = 1:N
    a(k)= log10((abs(x(k)-x_ext(k)))/2);
end

figure(3)
plot(a)
title('LBE 1º MAPA LOGÍSTICO E EXTENSÃO')
xlabel('Iterations')
ylabel('log_{10}(\epsilon_{\alpha,n})')

hold on

% LBE 1 MAPA LOGÍSTICO VPA


N = length(x);

x_vpa=vpa(x,10000);
x_ext_vpa=vpa(x_ext,10000);

for k = 1:N
    a(k)= log10((abs(x_vpa(k)-x_ext_vpa(k)))/2);
end

%figure(5)
plot(a,'o k')
title('LBE 1º MAPA LOGÍSTICO E EXTENSÃO - VPA')
xlabel('Iterations')
ylabel('log_{10}(\epsilon_{\alpha,n})')
legend('Double','VPA')


%------------------- 2° MAPA LOGÍSTICO ------------------------------------

x = single(x);

x2(1)=0.9;

x2 = single(x2);


for it=1:T-1

x2(it+1)=r*x2(it)*(1-x(it));

end

figure(1)
plot(tempo,x2,'o- r')
legend('x = 0.95', 'x = 0.9')



% RETRATO DE FASE

figure(2)
plot(x,x2)
title('Retrato de fase mapa logístico (sincronizado)')


% EXTENSÃO DO 2º MAPA LOGÍSTICO

x2_ext(1)=0.95;

for it=1:T-1
    
x2_ext(it+1)=r*x2_ext(it)*(1)-r*x2_ext(it)*x(it);

end


% LBE DO 2º MAPA LOGÍSTICO

N = length(x);

for k = 1:N
    a(k)= log10((abs(x2(k)-x2_ext(k)))/2);
end

figure(4)
plot(a)
title('LBE 2º MAPA LOGÍSTICO E EXTENSÃO - SINGLE')
xlabel('Iterations')
ylabel('log_{10}(\epsilon_{\alpha,n})')

axis([0 100 -16 0])
