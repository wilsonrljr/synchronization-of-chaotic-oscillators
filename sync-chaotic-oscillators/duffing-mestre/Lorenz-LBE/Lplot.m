%{
Article: Synchronization on the accuracy of chaotic oscillators simulations

download: https://www.researchgate.net/publication/321511735_Synchronization_on_the_accuracy_of_chaotic_oscillators_simulations

Uso: %arquivo para plotar a evolução do errro relativo das pseudo-órbitas

Other m-files required: rk4.m, rk5.m, lorenz.m, executar.m, grafico.m
Subfunctions: none
See also: rk4.m, rk5.m, lorenz.m, Lplot.m
Authors: Gabriel H. A. Silva, Igor C. Silva,  Wilson Rocha Lacerda Junior, Samir Angelo Milani Martins,
 Marcio F. S. Barroso and Erivelton Geraldo Nepomuceno

Website: http://www.ufsj.edu.br/gcom

Please send suggestions for improvement of the above code
to Wilson Rocha at this email address: wilsonrljr@outlook.com

References:
-----------

@article{silva2017synchronization,
  title={Synchronization on the accuracy of chaotic oscillators simulations},
  author={Silva, Gabriel HA and Silva, Igor C and Junior, Wilson RL and Martins, Samir AM and Barroso, Marcio FS and Nepomuceno, Erivelton G},
  journal={arXiv preprint arXiv:1712.01019},
  year={2017}
}

------------- BEGIN CODE --------------
%}


clear all; clc; close all;

x = load('xlor_ext_k=40_3600it.dat');
y = load('xlor_k=40_3600it.dat');

% x=xlor_k=0;
% y=duffing;

er=0.001;
for k=1:length(x)
    erm(k)=(abs(x(k)-y(k)))/2;
end
maxm=min(find(erm>er));
teste=ones(length(erm),1)*er;
i=length(x);

figure(1)
clf
plot(x,'*b')
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