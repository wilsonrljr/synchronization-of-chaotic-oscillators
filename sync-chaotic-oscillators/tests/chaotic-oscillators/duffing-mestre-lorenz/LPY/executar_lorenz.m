%clc, close all, clear all

% Formato de apresentação 
format long

% Parametros do modelo de Lorenz
sigma = 10;
beta = 8/3;
rho = 28;

% CondiÃ§Ãµes iniciais
y0=[1; 1; 1];

% y0=[1; 1; 1]; condição 1
% y0=[2; 2; 2]; condição 2


xd1=load('duffing.dat');
xd1=xd1(1:end-1);
h=1e-2;
k=0;
dt =0.05;
tspan=[0:dt:900]; 

Y(:,1)=y0;
yin = y0;
for i=1:length(tspan)
    tempo = i*dt;
    yout = rk4(@(t,y)lorenz(t,y,sigma,beta,rho,k,xd1,i),dt,tempo,yin);
    Y = [Y yout];
    yin = yout;
end
x = Y;
y2=Y(2,:);
xlord=Y(2,:);
x2=xlord./7.5;
plot3(Y(1,:),Y(2,:),Y(3,:))
xlabel('Atractor Dupla-volta','Interpreter','latex','FontSize',15)
grid on
%save('xlor_lpy_k=40.dat','xlord','-ascii') 

% plot(xlord,'b')
% hold on
% plot(xd1,'k')
% legend('Lorenz','Duffing');
% title('Sincronismo para k = 1000');