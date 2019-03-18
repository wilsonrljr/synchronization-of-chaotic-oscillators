
format long;
h=1e-2;
y0=[-0.5 -0.2 0];
tf=1000;
tspan = 0:h:tf;
x2 = ode4(@rossler2,tspan,y0);
plot3(x2(:,1),x2(:,2),x2(:,3),'MarkerSize',3)
xlabel('Atractor Dupla-volta','Interpreter','latex','FontSize',15)
grid on
