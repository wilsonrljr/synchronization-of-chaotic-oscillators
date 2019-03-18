%Arquivo principal%
%Pseudo-órbitas%
clc, close all, clear all

% % Modelo
% x1=load('xlor_lpy_k=0.dat');
% x2=load('xlor_lpy_k=30.dat');
 %x3=load('xlor_lpy_k=40.dat');
% 
% %Extensão
 %y1=load('xlor_lpyEx_k=0.dat');
% y2=load('xlor_lpyEx_k=30.dat');
 %y3=load('xlor_lpyEx_k=40.dat');

%Simulação Tradicional
executar_lorenz

%Simulação Tradicional 
executar_lorenz_ext

%Cálculo PSEUDO-ÓRBITA
lbe=abs(x(2,:)-x4(2,:))/2;
W=log2(lbe);
figure(1)
plot(tspan,W(1:end-1))
hold on
t1=tspan;
aux=[find(W(1:end-1)>-12)];
lbe(1:aux(1))=[];
t1(1:aux(1))=[];
aux=[find(W(1:end-1)>0)];
lbe(aux(1):end)=[];
t1(aux(1):end)=[];
aux1=polyfit(t1,log2(lbe),1);
lyap=aux1(1)
plot(t1,aux1(1)*t1+aux1(2),'r','LineWidth',2)
hold off
box off
xlabel('t','FontSize',15)
ylabel('log(|X1-X2|)','FontSize',15)
set(gcf, 'PaperPosition', [0 0 30 20]); 
set(gcf, 'PaperSize', [30 20]); 
set(gca,'FontSize',15,'Fontname','Times New Roman')
gtext(sprintf('%1.3f t %1.3f',aux1(1),aux1(2)),'Fontsize',15)
disp(lyap)