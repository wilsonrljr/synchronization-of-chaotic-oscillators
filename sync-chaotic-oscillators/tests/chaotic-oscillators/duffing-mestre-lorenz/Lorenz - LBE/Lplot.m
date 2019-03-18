clear all; clc; close all;

x = load('xlor_ext_k=250.dat');
y = load('xlor_k=250.dat');

% x=xlor_k=0;
% y=duffing;

er=0.001;
for k=1:length(x)
erm(k)= log10((abs(x(k)-y(k)))/2);

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
title('LBE Lorenz e Duffing para k=30');