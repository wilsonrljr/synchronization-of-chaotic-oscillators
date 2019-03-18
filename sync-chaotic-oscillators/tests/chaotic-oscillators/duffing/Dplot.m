%carrega os dados salvos de ambas as equivalencias
%e plota a comparação entre as duas e o erro 'erm'

clear all; clc; close all;
load dot05eqn.dat
load dot05orin.dat

x=dot05eqn;
y=dot05orin;

er=0.001;
for k=1:length(x)
erm(k)=(abs(x(k)-y(k)))/(abs(x(k)+y(k)));
end
maxm=min(find(erm>er));
teste=ones(length(erm),1)*er;
i=length(x);
figure(1)
clf
plot(x,'-k')
hold on
plot(y,'--k')
xlabel('n')
ylabel('G(X_n), H(X_n)')
figure(2)
semilogy(1:i,erm(1:i),'o-k')
hold on
semilogy(1:i,teste(1:i))
ylabel('log_{10}(\epsilon_{\alpha,n})')
xlabel('n')