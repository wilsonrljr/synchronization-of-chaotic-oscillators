clear all; close all; clc;

format long

% parametros do modelo de duffing
a = 7.5;
b = 0.05;

%condições iniciais
y0=[3; 4];

dt =0.05; %passo de integração
int=[0:dt:900]; %intervalo de simulação
ti=pi/60; 
t=(0:1:1000)*ti; %para a função cos(t)
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
%save('duffing.dat','xd1','-ascii')
