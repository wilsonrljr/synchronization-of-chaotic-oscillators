clear all; clc; close all;
load dot007eqn.dat  %dados do modelo equivalente
load dot007orin.dat % dados do modelo com outra equivalencia
x=dot007eqn;
y=dot007orin;

er=0.001; %critério de parada
for k=1:length(x)
erm(k)=(abs(x(k)-y(k)))/(abs(x(k)+y(k))); %lower bound
end
maxm=min(find(erm>er)); %número de iterações até ultrapassar o critério de parada pela 1ª vez
teste=ones(length(erm),1)*er;
i=length(x);
%i=5000;
figure(1) % plota a comparação entre as equivalencias
clf
plot(x,'-k')
hold on
plot(y,'--k')
xlabel('n')
ylabel('G(X_n), H(X_n)')

figure(2) %plota o lower bound 
semilogy(1:i,erm(1:i),'o-k')
hold on
semilogy(1:i,teste(1:i))
ylabel('log_{10}(\epsilon_{\alpha,n})')
xlabel('n')