clc; close all;  clear;
% define array of all waypoints

%anti-clockwise
% W = [0 0;
%     326 272;
%     633 314;
%     856 528;
%     910 833;
%     775 1111;
%     503 1257;
%     196 1215;
%     -26 1000;
%     -81 696;
%     53 418;
%     326 272];

W = [0 0;
    326 272;
    53 418;
    -81 696;
    -26 1000;
     196 1215;
     503 1257;
     775 1111];
%     910 833;
%     856 528;
%     633 314;
%     326 272];


     
    

p = [100,0]; % current position of drone
pinit = p;
pos = p; % array to store all positions over time
dis = 0;
goalRadius = 30; % radius within which waypoint is considered reached
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
% xlim([-50 900])
% ylim([-100 1100])
plot(pinit(1),pinit(2),'ro')
hold on
 

for i=2:size(W,1) % loop through all rows of waypoint array
    targetWaypoint = W(i,:); % select next waypoint
    distanceToGoal = norm(p - targetWaypoint);
    %jj = 1;
    while(distanceToGoal > goalRadius) %    jj<6000
        [psidot, d] = carrotLine(W(i-1,:), W(i,:), p, psi, del, va, k, Rmin, vw, psiw);
        if psidot > 100
            psidot
        end
        dis = [dis;d];
        [psi,p] = updatePosition(p(1), p(2), va, psi, psidot, 0.01);
        pos = [pos;p];
%          plot(p(1), p(2), 'rx')
%          hold on
        distanceToGoal = norm(p - targetWaypoint);
        %jj = jj+1;
    end
end


 plot(pos(:,1), pos(:,2),'r')
 hold on


%figure(2)
%correct error plot
%plot(dis)
% 
%  plot(robotLocation(:,1), robotLocation(:,2),'k--d')
%  xlim([0 25])
%  ylim([0 25])