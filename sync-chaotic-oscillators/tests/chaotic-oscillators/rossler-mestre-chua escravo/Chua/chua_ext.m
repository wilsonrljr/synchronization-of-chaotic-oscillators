
function dy = chua(t,y,alfa,beta,m1,m0)
% x = y(1)
% y = y(2)
% z = y(3)
dy = [
alfa*(y(2)-y(1)-m1*y(1)-0.5*(m0-m1)*(abs(y(1)+1)-abs(y(1)-1)));
y(1)-y(2)+y(3);
-beta*y(2)
];