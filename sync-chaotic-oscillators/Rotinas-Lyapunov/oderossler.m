
format long;
h=1e-2;
y0=[-0.5 -0.2 0];
tf=1000;
tspan = 0:h:tf;
x = ode4(@rossler,tspan,y0);
plot3(x(:,1),x(:,2),x(:,3),'MarkerSize',3)
xlabel('Atractor Dupla-volta','Interpreter','latex','FontSize',15)
grid on
