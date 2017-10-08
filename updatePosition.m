function [psinew,p] = updatePosition(x, y, va, psi, psidot, dt)

% x = 100;
% y = 0;
% va = 15;
% psi = 0;
% psidot = 0.333;



psinew = psi + (psidot*dt);
xdot = va*cosd(psinew);
ydot = va*sind(psinew);

xnew = x + (xdot*dt);
ynew = y + (ydot*dt);

p = [xnew, ynew];
