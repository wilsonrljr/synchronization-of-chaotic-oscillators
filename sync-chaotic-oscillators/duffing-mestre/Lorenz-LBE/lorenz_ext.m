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


function dy = lorenz_ext(t,y,sigma,beta,rho,k,xd1,i)

% dy = [
% sigma*(y(2)-y(1));
% y(1)*(rho-y(3))-y(2)+k.*x1(i);
% y(1)*y(2)-beta*y(3);

dy = [
    sigma*y(2)-sigma*y(1);
    y(1)*(rho-y(3))-y(2)+k.*xd1(i);
    y(1)*y(2)-beta*y(3);
    ];

