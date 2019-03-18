clear all; close all; clc;

format long

% Parametros do modelo de Lorenz
sigma = 10;
beta = 8/3;
rho = 28;

% Condições iniciais
y0=[1; 1; 1];

xd1=load('chua1.dat');
xd2=load('chua2.dat');
xd3=load('chua3.dat');
xd1=xd1(1:(end-1));
xd2=xd2(1:(end-1));
xd3=xd3(1:(end-1));

k=3500;
dt =0.05;
int=[0:dt:900]; 

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
aa=Y(2,:);
xlord=xlord./20;
save('xlor_ext_k=3500.dat','xlord','-ascii') 
plot(xlord,'b')
hold on
plot(xd1,'k')
legend('Lorenz','Duffing');
title('Sincronismo para k = 250');