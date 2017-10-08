clc; close all;  clear;
% define array of all waypoints
W = [0 0;
    300 300];

p = [10,0]; % current position of drone
pinit = p;
pos = p; % array to store all positions over time
goalRadius = 5; % radius within which waypoint is considered reached
psi = 45; % heading angle of drone
%del = 50; % "look-ahead" distance
va = 15; % UAV airspeed
%k = 0.5; % P Gain
tau = 100;
q22 = 1;
Rmin = 0;%3*va; % Minimum turning radius
vw = 0; % Wind Velocity
psiw = 0; % Wind direction

 

for i=2:size(W,1) % loop through all rows of waypoint array
    targetWaypoint = W(i,:); % select next waypoint
    %distanceToGoal = norm(p - targetWaypoint);
    jj = 1;
    while(jj<5000) % distanceToGoal > goalRadius
        psidot = LQRLine(W(i-1,:), W(i,:), p, tau, q22, va, psi, vw, psiw);
        [psi, p] = updatePosition(p(1), p(2), va, psi, psidot, 0.01);
        pos = [pos;p];
        %distanceToGoal = norm(p - targetWaypoint);
        jj = jj+1;
    end
end

plot(W(:,1), W(:,2),'k--d')
hold on
%xlim([0 400])
%ylim([-100 400])
plot(pos(:,1), pos(:,2),'b')
hold on
plot(pinit(1),pinit(2),'r>')

% 
%  plot(robotLocation(:,1), robotLocation(:,2),'k--d')
%  xlim([0 25])
%  ylim([0 25])