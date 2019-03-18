clc; clear all; close all;

format long;

%r = 4;
r=linspace(2.4,4,1000);
T = 1000; 
x=0.95*ones(size(r));
X=x;
for it=1:T-1
  x=r.*x.*(1-x); %note a multiplica¸c~ao linha a linha .*
  X=[X x];  
    
%x(it+1)=r*x(it)*(1-x(it));
end

tempo=(1:T)-1;
stem(tempo,x)
xlabel('tempo (anos)') %dando nome aos eixos
ylabel('populacao')

xeq=1-1/r;
hold on %mant´em que o gr´afico anterior ao plotarmos a nova curva
plot(tempo,xeq*ones(length(tempo),1),'r')
legend('simulacao', 'equilibrio')

%axis([-1 200 0 1])

figure()
plot(x,r)