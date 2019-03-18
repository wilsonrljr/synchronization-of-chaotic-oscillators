y = load('xlor_cond1=40.dat');
y_l = load('xlor_cond2=40.dat');
figure()
plot(y(5000:end),y_l(5000:end),'k')
%plot(y,y_l,'k')
xlabel('y');
ylabel('y''');