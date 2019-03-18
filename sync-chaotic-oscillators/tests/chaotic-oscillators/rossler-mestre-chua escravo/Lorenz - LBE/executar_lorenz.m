clear all; close all; clc;

format long
% Parametros do modelo de Lorenz
sigma = 10;
beta = 8/3;
rho = 28;

% CondiÃ§Ãµes iniciais
y0=[1; 1; 1];

% y0=[1; 1; 1]; condição 1
% y0=[2; 2; 2]; condição 2



xd1=load('chua1.dat');
xd2=load('chua2.dat');
xd3=load('chua3.dat');
xd1=xd1(1:(end-1));
xd2=xd2(1:(end-1));
xd3=xd3(1:(end-1));

k=0;
dt =0.05;
int=[0:dt:900]; 

Y(:,1)=y0;
yin = y0;
for i=1:length(int)
    tempo = i*dt;
    yout = rk4(@(t,y)lorenz(t,y,sigma,beta,rho,k,xd1,i),dt,tempo,yin);
    Y = [Y yout];
    yin = yout;
end
y2=Y(3,:);
xlord=Y(3,:);
%xlord=xlord./20;
save('xlordriver.dat','xlord','-ascii') 
plot(xlord,'b')
hold on
plot(xd1,'k')
legend('Lorenz','Circuito de Chua');
title('Sincronismo para k = 1000');

%  figure(2)
%  plot(xd1,xlord(1:(end-1)))