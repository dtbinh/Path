clc; 
close all;  
clear;
% define array of all waypoints
W = [0 0;
    300 300];

p = [100,0]; % current position of drone
pinit = p;
pos = p; % array to store all positions over time
goalRadius = 5; % radius within which waypoint is considered reached
psi = 0; % heading angle of drone
L = 100;
%del = 50; % "look-ahead" distance
va = 15; % UAV airspeed
k = 1; % P Gain
Rmin = 0;%3*va; % Minimum turning radius
vw = 0; % Wind Velocity
psiw = 0; % Wind direction

 

for i=2:size(W,1) % loop through all rows of waypoint array
    targetWaypoint = W(i,:); % select next waypoint
    distanceToGoal = norm(p - targetWaypoint);
    slope = (W(i,2)-W(i-1,2))/(W(i,1)-W(i-1,1));
    if abs(slope) == inf
        incp = W(i,1);
    else
        incp = W(i,2) - slope*W(i,1);
    end
    %jj = 1;
    while(distanceToGoal > goalRadius) %jj<2200
        psidot = NLGLLine(slope, incp, p, psi, L, va);
        [psi,p] = updatePosition(p(1), p(2), va, psi, psidot, 0.01);
        pos = [pos;p];
        distanceToGoal = norm(p - targetWaypoint);
        %jj = jj+1;
    end
end

figure(1)
plot(W(:,1), W(:,2),'k--d')
hold on
xlim([0 400])
ylim([-100 400])
plot(pos(:,1), pos(:,2),'b')
hold on
plot(pinit(1),pinit(2),'ro')

%figure(2)
%correct error plot
%plot(dis)
% 
%  plot(robotLocation(:,1), robotLocation(:,2),'k--d')
%  xlim([0 25])
%  ylim([0 25])