clc; 
close all;  
clear;
% define array of all waypoints

O = [0 0]; % Centre of circle
r = 100; % radius of path circle
p = [100,0]; % current position of drone
psi = 90; % heading angle of drone
pinit = p;
pos = p; % array to store all positions over time

%goalRadius = 5; % radius within which waypoint is considered reached

%del = 50; % "look-ahead" distance
va = 15; % UAV airspeed
%k = 0.5; % P Gain
tau = 100;
q22 = 1;
Rmin = 0;%3*va; % Minimum turning radius
vw = 0; % Wind Velocity
psiw = 0; % Wind direction

 

jj = 1;
while(jj<5000)
    psidot = LQRCircle(O, r, p, psi, va, q22, tau);
    [psi, p] = updatePosition(p(1), p(2), va, psi, psidot, 0.01);
    pos = [pos;p];
    jj = jj+1;
end

drawCircle(O(1), O(2), r);
hold on
%xlim([0 400])
%ylim([-100 400])
plot(pos(:,1), pos(:,2),'b')
hold on
plot(pinit(1),pinit(2),'r>')