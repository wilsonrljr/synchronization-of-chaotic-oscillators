clear all; close all; clc;

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
k=25;
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
y2=Y(2,:);
xlord=Y(2,:);
xlord=xlord./7.5;
%save('xlor_k=25.dat','xlord','-ascii') 
plot(xlord,'b')
hold on
plot(xd1,'-*k')
legend('Lorenz','Duffing');
%title('Sincronismo para k = 1000');
xlabel('Iterations');
ylabel('Amplitude');
axis([0 1000 -5 5])
figure()
plot3(Y(1,:),Y(2,:),Y(3,:));
figure()
plot(Y(1,:),Y(2,:));
figure()
plot(Y(1,:),Y(2,:));
figure()
plot(Y(2,:),Y(3,:));