clear all; close all; clc;

format long 
    
% parametros do modelo chua

alfa = 15.6;
beta = 28;
m0 = -1.143;
m1 = -0.714;

%condições iniciais
y0=[0.7; 0; 0;];

xd1=load('xros2_1800.dat');
k=4.7;

dt =0.05; %passo de integração
int=[0:dt:1800]; %intervalo de simulação
Y(:,1)=y0; %inicializa o vetor das saidas
yin = y0;
for i=1:length(int)
    tempo = i*dt;
    ysaida = rk4(@(t,y)chua(t,y,alfa,beta,m1,m0,xd1,k,i),dt,tempo,yin);
    Y = [Y ysaida];
    yin = ysaida;
end

y2=Y(1,:);

plot(Y(1,:));
xlord=Y(1,:);
xlord=xlord./10;
save('xchuak8_1800.dat','xlord','-ascii') 
figure()
plot(xlord,'b')
hold on
plot(xd1,'k')
legend('Chua','Rossler');
title('Sincronismo para k = 1000');