%equivalencias matematicas 


% function dy = duffing(t,y,a,b)
% 
% dy = [
% y(2);
% a*cos(t)-b*y(2)-y(1)^3;
% ];

function dy = duffing(t,y,a,b)

dy = [
y(2);
a*cos(t)-b*y(2)-y(1)*y(1)*y(1);
];