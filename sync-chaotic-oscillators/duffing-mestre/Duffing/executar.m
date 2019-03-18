%{
Article: Synchronization on the accuracy of chaotic oscillators simulations

download: https://www.researchgate.net/publication/321511735_Synchronization_on_the_accuracy_of_chaotic_oscillators_simulations


Uso: Essa rotina gera os dados do modelo de Duffing. Ver também: Dplot.m

Other m-files required: rk4.m, rk5.m, duffing.m
Subfunctions: none
MAT-files required: none
See also: rk4.m, rk5.m, duffing.m, Dplot.m
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

% parametros do modelo de duffing
a = 7.5;
b = 0.05;

%condi��es iniciais
y0=[3; 4];

dt =0.05; %passo de integra��o
int=[0:dt:3600]; %intervalo de simula��o
ti=pi/60;
t=(0:1:1000)*ti; %para a fun��o cos(t)
Y(:,1)=y0; %inicializa o vetor das saidas
yin = y0;
for i=1:length(int)
    tempo = i*dt;
    ysaida = rk4(@(t,y)duffing(t,y,a,b),dt,tempo,yin);
    Y = [Y ysaida];
    yin = ysaida;
end

plot(Y(1,:),Y(2,:),'r')
xd1=Y(1,:);
save('duffing3600.dat','xd1','-ascii')
