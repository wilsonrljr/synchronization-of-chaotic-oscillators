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


xd1=load('chua1.dat');
%xd1=load('chua2.dat');
%xd1=load('chua3.dat');
xd1=xd1(1:end-1);
h=1e-2;
k=0;
dt =0.05;
tspan=[0:dt:900]; 

Y1(:,1)=y0;
yin = y0;
for i=1:length(tspan)
    tempo = i*dt;
    yout = rk4(@(t,y)lorenz_ext(t,y,sigma,beta,rho,k,xd1,i),dt,tempo,yin);
    Y1 = [Y1 yout];
    yin = yout;
end
x4 = Y1;
y2=Y1(2,:);
xlord=Y1(2,:);
x2=xlord./7.5;

plot3(Y1(1,:),Y1(2,:),Y1(3,:))
xlabel('Atractor Dupla-volta','Interpreter','latex','FontSize',15)
%save('xlor_lpyEx_k=40.dat','xlord','-ascii') 
grid on

% plot(xlord,'b')
% hold on
% plot(xd1,'k')
% legend('Lorenz','Duffing');
% title('Sincronismo para k = 250');