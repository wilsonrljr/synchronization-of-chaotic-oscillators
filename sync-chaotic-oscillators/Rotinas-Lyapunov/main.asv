%Arquivo principal%
%Pseudo-órbitas%

%Simulação Tradicional
oderossler

%Simulação Tradicional 
oderossler2

%Cálculo PSEUDO-ÓRBITA
lbe=abs(x(:,1)-x2(:,1))/2;
figure(1)
plot(tspan,log10(lbe),'k.')
hold on
t1=tspan';
aux=[find(log10(lbe)>-12)];
lbe(1:aux(1))=[];
t1(1:aux(1))=[];
aux=[find(log10(lbe)>0)];
lbe(aux(1):end)=[];
t1(aux(1):end)=[];
aux1=polyfit(t1,log(lbe),1);
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