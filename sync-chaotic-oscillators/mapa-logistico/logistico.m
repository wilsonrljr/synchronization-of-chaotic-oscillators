close all; clear all; clc
format long
x(1) = 0.1; 
y(1) = x(1);
z(1) = y(1);
h(1) = z(1);

% Extens�es Intervalares
for k=1:100
  x(k+1,1) = 2.6868*x(k) - 0.2462*x(k)^3;
  y(k+1,1) = 2.6868*y(k) - (0.2462*y(k))*y(k)^2;
  z(k+1,1) = 2.6868*z(k) - (0.2462*z(k))*z(k)*z(k);
  h(k+1,1) = h(k)*(2.6868 - 0.2462*h(k)*h(k)) ;
end

%Figura 1 Extens�es Intervalares
figure(1)
plot(1:60,x(1:60),'x-m')
hold on
plot(1:60,y(1:60),'o-b','LineWidth',1)
hold on
plot(1:60,z(1:60),'*-r','LineWidth',1)
hold on
plot(1:60,h(1:60),'^-k','LineWidth',1)
xlabel('n')
ylabel('F(X_n) ,G(X_n), H(X_n), L(X_n)','LineWidth',1)

%%
%Stop criterion
%Relative required precision

er=0.001;
for k=1:101
  erm(k)=(abs(x(k)-y(k)))/(abs(x(k)+y(k)));
  erm1(k)=(abs(x(k)-z(k)))/(abs(x(k)+z(k)));
  erm2(k)=(abs(x(k)-h(k)))/(abs(x(k)+h(k)));
  erm3(k)=(abs(y(k)-z(k)))/(abs(y(k)+z(k)));
  erm4(k)=(abs(y(k)-h(k)))/(abs(y(k)+h(k)));
  erm5(k)=(abs(z(k)-h(k)))/(abs(z(k)+h(k)));
  M= [erm(k) erm1(k) erm2(k) erm3(k) erm4(k) erm5(k)]';
  M2= max(M);
  mx(k)= M2;
  
end

%Maximum iteration
maxm=min(find(erm>er));
maxm1=min(find(erm1>er));
maxm2=min(find(erm2>er));

figure(2)
plot(6:k,log10(erm(6:k)),'o-r','LineWidth',1)
hold on
plot(6:k,log10(er*ones(1,k-5)),'k','LineWidth',1)
hold on
plot(6:k,log10(erm1(6:k)),'*-b','LineWidth',1)
hold on
plot(6:k,log10(erm2(6:k)),'s-r','LineWidth',1)
hold on
plot(6:k,log10(erm3(6:k)),'d-m','LineWidth',1)
hold on
plot(6:k,log10(erm4(6:k)),'^-g','LineWidth',1)
hold on
plot(6:k,log10(erm5(6:k)),'h-y','LineWidth',1)
hold on
plot(6:k,log10(mx(6:k)),'o-k','LineWidth',1)
xlabel('n')
ylabel(' log_{10}(\epsilon_{\alpha,n})')

%%
% C�lculo do LBE

for k=1:101
    lbe(k)=log10(abs(x(k)-y(k))/2);
    lbe1(k)=log10(abs(x(k)-z(k))/2);
    lbe2(k)=log10(abs(x(k)-h(k))/2);
    lbe3(k)=log10(abs(y(k)-z(k))/2);
    lbe4(k)=log10(abs(y(k)-h(k))/2);
    lbe5(k)=log10(abs(z(k)-h(k))/2);
    L = [lbe(k) lbe1(k) lbe2(k) lbe3(k) lbe4(k) lbe5(k)]';
    L2= max(L);
    lx(k)= L2;
end

figure(3)
plot(6:k,log10(abs(x(6:k)-y(6:k))/2),'-xr','LineWidth',1);
hold on
%plot(6:k,log10(abs(x(6:k)-z(6:k))/2),'-xk','LineWidth',1);
hold on
% plot(6:k,log10(abs(x(6:k)-h(6:k))/2),'-dk','LineWidth',1);
% hold on
% plot(6:k,log10(abs(y(6:k)-z(6:k))/2),'->k','LineWidth',1);
% hold on
% plot(6:k,log10(abs(y(6:k)-h(6:k))/2),'-^k','LineWidth',1);
% hold on
% plot(6:k,log10(abs(z(6:k)-h(6:k))/2),'-*k','LineWidth',1);
% hold on
plot(6:k,lx(6:k),'-ok','LineWidth',1);
xlabel('n')
ylabel(' log_{10}(\delta_{\alpha,n})')

%%
% Simula��o com alta precis�o

digits(1000);
f(1) = vpa('1/10');
a=vpa('26868/10000');
b=vpa('2462/10000');
for k=1:100
  f(k+1,1) = vpa(a*f(k) - (b*f(k))*f(k)^2);
end

figure(4)
plot(log10(abs(vpa(f(2:k)-y(2:k)))),'-xm','LineWidth',1); % Compara��o entre VPA e primeira extens�o
hold on
plot(2:k,(lx(2:k)),'>-k','LineWidth',1) % Valor m�ximo do LBE obtido das extens�es intervalares
hold on
plot(2:k,log10(abs(x(2:k)-y(2:k))/2),'-or','LineWidth',1); % LBE para duas extens�es intervalares
legend('VPA','Max(LBE)','EI')


for k=1:101
    Lbe(k)=(abs(x(k)-y(k))/2);
    Lbe1(k)=(abs(x(k)-z(k))/2);
    Lbe2(k)=(abs(x(k)-h(k))/2);
    Lbe3(k)=(abs(y(k)-z(k))/2);
    Lbe4(k)=(abs(y(k)-h(k))/2);
    Lbe5(k)=(abs(z(k)-h(k))/2);
    M = [Lbe(k) Lbe1(k) Lbe2(k) Lbe3(k) Lbe4(k) Lbe5(k)]';
    M2= max(M);
    mx(k)= M2;
end
    
%  Tabelas
  

% fprintf('Extens�o F e G e erro')
% [(abs(vpa(y(2:11)-f(2:11)))) (abs(x(2:11)-y(2:11))/2) (mx(2:11))];
