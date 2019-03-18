%{
Article: Synchronization on the accuracy of chaotic oscillators simulations

download: https://www.researchgate.net/publication/321511735_Synchronization_on_the_accuracy_of_chaotic_oscillators_simulations


Uso: Essa rotina gera os dados do modelo de Lorenz sincronizado. Ver também: Lplot.m

Other m-files required: rk4.m, rk5.m, lorenz.m
Subfunctions: none
MAT-files required: none
See also: rk4.m, rk5.m, lorenz.m, Lplot.m
Authors: Gabriel H. A. Silva, Igor C. Silva,  Wilson Rocha Lacerda Junior, Samir Angelo Milani Martins,
 Marcio F. S. Barroso and Erivelton Geraldo Nepomuceno

Website: http://www.ufsj.edu.br/gcom

Please send suggestions for improvement of the above code
to Wilson Rocha at this email address: wilsonrljr@outlook.com

------------- BEGIN CODE --------------

References:
-----------

@article{silva2017synchronization,
  title={Synchronization on the accuracy of chaotic oscillators simulations},
  author={Silva, Gabriel HA and Silva, Igor C and Junior, Wilson RL and Martins, Samir AM and Barroso, Marcio FS and Nepomuceno, Erivelton G},
  journal={arXiv preprint arXiv:1712.01019},
  year={2017}
}
%}

clear all; close all; clc;

% Parametros do modelo de Lorenz
sigma = 10;
beta = 8/3;
rho = 28;

% Condições iniciais
y0=[1; 1; 1];

xd1=load('duffing3600.dat');
xd1=xd1(1:end-1);
k=40;
dt =0.05;
int=[0:dt:3600];

Y(:,1)=y0;
yin = y0;
for i=1:length(int)
    tempo = i*dt;
    yout = rk4(@(t,y)lorenz_ext(t,y,sigma,beta,rho,k,xd1,i),dt,tempo,yin);
    Y = [Y yout];
    yin = yout;
end
y2=Y(2,:);
xlord=Y(2,:);
xlord=xlord./6.5;
save('xlor_ext_k=40_3600it.dat','xlord','-ascii')
plot(xlord,'b')
hold on
plot(xd1,'*k')
legend('Lorenz','Duffing');
title('Sincronismo para k = 40 - 300it');