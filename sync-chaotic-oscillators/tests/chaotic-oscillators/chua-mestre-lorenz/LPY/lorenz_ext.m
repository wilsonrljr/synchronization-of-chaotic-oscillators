function dy = lorenz_ext(t,y,sigma,beta,rho,k,xd1,i)

%  x1=load('x1.dat');
%  k=15;
% for j=1:18002
%     m(j)=x1(j);
% end
% dy = [
% sigma*(y(2)-y(1));
% y(1)*(rho-y(3))-y(2)+k.*x1(i);
% y(1)*y(2)-beta*y(3);

dy = [
sigma*y(2)-sigma*y(1);
y(1)*(rho-y(3))-y(2)+k.*xd1(i);
y(1)*y(2)-beta*y(3);
];

