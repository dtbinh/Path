clc; 
%close all;  
clear;
% define array of all waypoints
W = [0 0;
    300 300];

p = [100,0]; % current position of drone
pinit = p;
pos = p; % array to store all positions over time
goalRadius = 5; % radius within which waypoint is considered reached
psi = 0; % heading angle of drone


%del = 50; % "look-ahead" distance
va = 15; % UAV airspeed
%k = 0.5; % P Gain
%tau = 45;
%q22 = 1;
psi_inf = 45;
k = 1;
kappa = 1;
Rmin = 0;%3*va; % Minimum turning radius
vw = 0; % Wind Velocity
psiw = 0; % Wind direction



for i=2:size(W,1) % loop through all rows of waypoint array
    targetWaypoint = W(i,:); % select next waypoint
    %distanceToGoal = norm(p - targetWaypoint);
    jj = 1;
    while(jj<2000) %   distanceToGoal > goalRadius
        psidot = VFLineTest(W(i-1,:), W(i,:), p, psi, k, kappa, psi_inf);
        [psi, p] = updatePosition(p(1), p(2), va, psi, psidot, 0.1);
        pos = [pos;p];
        %distanceToGoal = norm(p - targetWaypoint);
        jj = jj+1;
    end
end

figure(1)
plot(W(:,1), W(:,2),'k--d')
hold on
xlim([0 400])
ylim([-100 400])
plot(pinit(1),pinit(2),'ro')
hold on
plot(pos(:,1), pos(:,2))
hold on


% 
%  plot(robotLocation(:,1), robotLocation(:,2),'k--d')
%  xlim([0 25])
%  ylim([0 25])