%{
Article: Synchronization on the accuracy of chaotic oscillators simulations

download: https://www.researchgate.net/publication/321511735_Synchronization_on_the_accuracy_of_chaotic_oscillators_simulations

Uso: Essa rotina gera os dados do modelo de Lorenz. Ver também: Dplot.m

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

% uncomment the lines below to change the interval extension

% function dy = duffing(t,y,a,b)
%
% dy = [
% y(2);
% a*cos(t)-b*y(2)-y(1)^3;
% ];

function dy = duffing(t,y,a,b,k,xd1,i)

dy = [
    y(2)+k.*xd1(i);
    a*cos(t)-b*y(2)-y(1)*y(1)*y(1);
    ];