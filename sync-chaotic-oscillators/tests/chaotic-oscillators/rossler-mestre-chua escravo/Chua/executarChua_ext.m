clear all; close all; clc;

format long 
    
% parametros do modelo chua
alfa = 15.6;
beta = 28;
m0 = -1.143;
m1 = -0.714;

%condições iniciais
y0=[0.7; 0; 0;];

dt =0.05; %passo de integração
int=[0:dt:900]; %intervalo de simulação
Y(:,1)=y0; %inicializa o vetor das saidas
yin = y0;
for i=1:length(int)
    tempo = i*dt;
    ysaida = rk4(@(t,y)chua(t,y,alfa,beta,m1,m0),dt,tempo,yin);
    Y = [Y ysaida];
    yin = ysaida;
end

plot3(Y(1,:),Y(2,:),Y(3,:),'r')
xd1=Y(1,:);
xd2=Y(2,:);
xd3=Y(3,:);
save('chua1.dat','xd1','-ascii')
save('chua2.dat','xd2','-ascii')
save('chua3.dat','xd3','-ascii')

figure(2)
plot(Y(1,:))

figure(3)
plot(Y(2,:))

figure(4)
plot(Y(3,:))