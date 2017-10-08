clc; close all;  clear;
% define array of all waypoints
W = [0 0;
    300 300;
    300 600];
%   800 1000];

p = [100,0]; % current position of drone
pinit = p;
pos = p; % array to store all positions over time
dis = 0;
goalRadius = 5; % radius within which waypoint is considered reached
psi = 90; % heading angle of drone
del = 50; % "look-ahead" distance
va = 15; % UAV airspeed
k = 1; % P Gain
Rmin = 0;%3*va; % Minimum turning radius
vw = 0; % Wind Velocity
psiw = 0; % Wind direction

figure(1)
plot(W(:,1), W(:,2),'k--d')
hold on
xlim([0 900])
ylim([-100 1100])
plot(pinit(1),pinit(2),'ro')
hold on
 

for i=2:size(W,1) % loop through all rows of waypoint array
    if i >= 3
        i
    end
    targetWaypoint = W(i,:); % select next waypoint
    distanceToGoal = norm(p - targetWaypoint);
    jj = 1;
    while(distanceToGoal > goalRadius) %jj<6000
        [psidot, d] = carrotLine(W(i-1,:), W(i,:), p, psi, del, va, k, Rmin, vw, psiw, i>=3);
        dis = [dis;d];
        [psi,p] = updatePosition(p(1), p(2), va, psi, psidot, 0.01);
        pos = [pos;p];
        plot(p(1), p(2), 'rx')
        hold on
        distanceToGoal = norm(p - targetWaypoint);
        jj = jj+1;
    end
end


%  plot(pos(:,1), pos(:,2))
%  hold on


%figure(2)
%correct error plot
%plot(dis)
% 
%  plot(robotLocation(:,1), robotLocation(:,2),'k--d')
%  xlim([0 25])
%  ylim([0 25])